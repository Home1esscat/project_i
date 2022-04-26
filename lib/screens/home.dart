import 'package:flutter/material.dart';
import 'package:project_i/widgets/not_implemented_chip.dart';

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
      body: const Center(child: NotImplementedChip()),
    );
  }
}
