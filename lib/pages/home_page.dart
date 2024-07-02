import 'package:flutter/material.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // hive box refference 
  final _toDoBox = Hive.box('toDoBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if first time ever open the app then init data
    if (_toDoBox.get("TODOLIST") == null) {
      db.createInitialData();
    }
    else {
      // Data already exist
      db.loadData();
    }

    super.initState();
  }

  // Controller for the dialog box
  final _controller = TextEditingController();

  // List of tasks

  // Checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  // Save new task method 
  void saveNewTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      }
      Navigator.pop(context);
    });
  }
  // Create new task method
  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller:_controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("TO DO"))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask(),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            isCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        }

      )
    );
  }
}