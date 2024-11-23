// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
      ["Buy Food", false],
      ["Exercise", false],
  ];
  
  void checkBoxChanged(bool? value, int index){
      setState(() {
        toDoList[index][1] = !toDoList[index][1];
      });
  }

  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context) {
          return AlertDialog();
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        title: Center(child: Text("To-Do")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: createNewTask,
      child: Icon(Icons.add),),
      body: ListView.builder(
         itemCount: toDoList.length,
         itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0], 
              taskCompleted: toDoList[index][1],
               onChanged: (value)=> checkBoxChanged(value, index),
            );
         },
      ),

    );
  }
}