// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        title: Center(child: Text("To-Do")),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ToDoTile(
            taskCompleted: false,
            taskName: "Make Tutorial",
            onChanged: (p0) => {},
          ),
          ToDoTile(
            taskCompleted: false,
            taskName: "Do maths Exercises",
            onChanged: (p0) => {},
          ),

        ],
      ),
    );
  }
}