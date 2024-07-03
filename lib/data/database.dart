import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  // Refference the hive box
  final _toDoBox = Hive.box('todobox');
  
  // First time ever open the app 
  void createInitialData() {
    toDoList = [
      ["Buy milk", false],
      ["Buy eggs", false],
      ["Buy bread", false],
    ];
  }

  // Load data from hive 
  void loadData() {
    toDoList = _toDoBox.get("TODOLIST");
  }

  // Update the database
  void updateDataBase() {
    _toDoBox.put("TODOLIST", toDoList);
    print(_toDoBox);
  }

}