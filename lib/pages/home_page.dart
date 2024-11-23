import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // For encoding/decoding JSON
import 'package:todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List<List<dynamic>> toDoList = []; // Task list

  @override
  void initState() {
    super.initState();
    loadTasks(); // Load tasks when the app starts
  }

  // Save tasks to SharedPreferences
  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(toDoList); // Convert list to JSON
    await prefs.setString('tasks', encodedData);
  }

  // Load tasks from SharedPreferences
  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksData = prefs.getString('tasks');
    if (tasksData != null) {
      setState(() {
        toDoList = List<List<dynamic>>.from(
          jsonDecode(tasksData).map((item) => List<dynamic>.from(item)),
        );
      });
    }
  }

  // Add a new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    saveTasks(); // Save updated list
    Navigator.of(context).pop();
  }

  // Delete a task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
    saveTasks(); // Save updated list
  }

  // Toggle task completion
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = value!;
    });
    saveTasks(); // Save updated list
  }

  // Create a new task dialog
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: saveNewTask,
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        title: const Text("To-Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: () => deleteTask(index),
          );
        },
      ),
    );
  }
}
