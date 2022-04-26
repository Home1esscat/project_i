import 'package:flutter/material.dart';

class NotImplementedChip extends StatelessWidget {
  const NotImplementedChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Chip(
      avatar: CircleAvatar(
        radius: 24,
        child: Icon(Icons.task_alt_rounded, color: Colors.white),
        backgroundColor: Colors.red,
      ),
      label: Text(
        "NOT IMPLEMENTED YET",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Color.fromARGB(255, 110, 15, 15),
        ),
      ),
    );
  }
}
