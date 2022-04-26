import 'package:flutter/material.dart';
import 'package:project_i/widgets/not_implemented_chip.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thingiverse - Favorite",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(child: NotImplementedChip()),
    );
  }
}
