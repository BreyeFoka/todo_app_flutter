// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/to_do.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
      useMaterial3: true, // Opt into Material 3
      colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.yellow, // Generate a color scheme from the swatch
  ),
),
    );
  }
}