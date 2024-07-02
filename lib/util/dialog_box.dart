import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(10), right: Radius.circular(10))),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add button
                ElevatedButton(
                  onPressed: onSave, 
                  child: const Text("Add"),
                ),
                const Spacer(),
                // Cancel button
                ElevatedButton(
                  onPressed: onCancel, 
                  child: const Text("Cancel"))
              ],
            ),]
          )
      ),
    );
  }
}