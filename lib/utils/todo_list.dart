// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

 ToDoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0, right: 25.0, top: 25.0),
      child: Container
      (
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.black,),
            Text(taskName, style: TextStyle(
              decoration: taskCompleted? TextDecoration.lineThrough :TextDecoration.none,
              fontSize: 18,
            ),),

          ],
        ),
        decoration: BoxDecoration(color: Colors.yellow[500], borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}