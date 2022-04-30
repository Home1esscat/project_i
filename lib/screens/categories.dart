import 'package:flutter/material.dart';

import '../widgets/not_implemented_chip.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.search_rounded))
        ],
        title: const Text("Thingiverse - Categories",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: const Center(
        child: NotImplementedChip(),
      ),
    );
  }
}
