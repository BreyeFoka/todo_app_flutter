import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Inner padding
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16, // Font size
          fontWeight: FontWeight.bold, // Font weight
        ),
    )
    );
  }
}