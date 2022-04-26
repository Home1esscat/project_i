import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.sort_rounded),
          ),
        ],
        title: const Text("Thingiverse - Home",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(color: Colors.white),
    );
  }
}
