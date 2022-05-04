import 'package:flutter/material.dart';
import 'package:project_i/network/constants.dart';
import 'package:project_i/screens/universal_grid.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.sort_rounded),
        onPressed: (() => {}),
        backgroundColor: GlobalColors.globalColor,
      ),
      body: const UniversalGrid(),
    );
  }
}
