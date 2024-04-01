import 'package:flutter/material.dart';

class Lab1 extends StatelessWidget {
  const Lab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Background color for the container
      padding: EdgeInsets.all(20), // Padding around the text
      child: Center(
        child: Text(
          'Lab 1',
          style: TextStyle(
            fontSize: 24, // Font size of the text
            color: Colors.white, // Text color
            fontWeight: FontWeight.bold, // Font weight
          ),
        ),
      ),
    );
  }
}
