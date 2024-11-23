import 'package:flutter/material.dart';
import 'package:todo_app/utils/button.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  Dialogbox({super.key, required this.controller,
              required this.onSave,
              });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightBlue[200],
      content: Container(
        height: 150,
        padding: const EdgeInsets.all(12.0), // Uniform padding for the entire container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
             const SizedBox(height: 20), // Space between the TextField and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Even spacing between buttons
              children: [
                // Save Button
                Expanded(
                  child: MyButton(
                    text: "Save",
                    onPressed: onSave
                  ),
                ),
                const SizedBox(width: 10), // Space between Save and Cancel buttons
                // Cancel Button
                Expanded(
                  child: MyButton(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
