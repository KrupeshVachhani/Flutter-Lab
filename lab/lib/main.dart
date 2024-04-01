import 'package:flutter/material.dart';
import 'package:lab/app.dart'; // Import the file where MyHomePage is defined

void main() {
  runApp(const Lab());
}

class Lab extends StatelessWidget {
  const Lab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
