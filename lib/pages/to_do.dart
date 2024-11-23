 // ignore_for_file: prefer_const_constructors

 import 'package:flutter/material.dart';

 class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  //Text editing controller to  get access to user input
  TextEditingController myController=TextEditingController();
  void greetUser(){
    String username=myController.text;
    setState(() {
        greetingMessage="Hello ${username}";
    });
    
  }
  String greetingMessage = "";
  @override
void dispose() {
  myController.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(greetingMessage),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border:  OutlineInputBorder(),
                  hintText: "Type In your name"
                ),
              ),
              ElevatedButton(onPressed: greetUser, child: Text('tap'))
            ],
          ),
        ),
      ),
    );
  }
}