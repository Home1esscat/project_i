import 'package:flutter/material.dart';

class UniversalGrid extends StatelessWidget {
  const UniversalGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        crossAxisCount: 3,
        children: [
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.yellow,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.green,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.lightBlue,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.lightGreen,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.brown,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.yellow,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.green,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.lightBlue,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.lightGreen,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.brown,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.yellow,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.green,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.lightBlue,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.lightGreen,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.brown,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
