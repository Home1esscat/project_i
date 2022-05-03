import 'package:flutter/material.dart';
import 'package:project_i/screens/universal_grid.dart';

class SelectedCategory extends StatefulWidget {
  const SelectedCategory({Key? key}) : super(key: key);

  @override
  State<SelectedCategory> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _getThingsGrid(),
        floatingActionButton: _getFab(context),
      ),
      color: Colors.white,
    );
  }

  FloatingActionButton _getFab(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.arrow_back_rounded),
      onPressed: (() => {Navigator.pop(context)}),
      backgroundColor: Colors.red,
    );
  }

  Widget _getThingsGrid() {
    return const UniversalGrid();
  }
}
