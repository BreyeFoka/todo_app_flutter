// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

 ToDoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged, required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(onPressed: deleteTask,
                          icon: Icons.delete,
                          backgroundColor: Colors.red.shade300,)
        ]),
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.white,),
              Text(taskName, style: TextStyle(
                decoration: taskCompleted? TextDecoration.lineThrough :TextDecoration.none,
                fontSize: 18,
              ),),
        
            ],
          ),
          decoration: BoxDecoration(color: Colors.lightBlue[500], borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}