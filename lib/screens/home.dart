import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.sort_rounded),
        onPressed: (() => {}),
        backgroundColor: Colors.red,
      ),
      body: const Center(),
    );
  }
}
