import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lab/Labs/lab1.dart';
import 'package:lab/Labs/lab10.dart';
import 'package:lab/Labs/lab11.dart';
import 'package:lab/Labs/lab12.dart';
import 'package:lab/Labs/lab2.dart';
import 'package:lab/Labs/lab3.dart';
import 'package:lab/Labs/lab4.dart';
import 'package:lab/Labs/lab5.dart';
import 'package:lab/Labs/lab6.dart';
import 'package:lab/Labs/lab7.dart';
import 'package:lab/Labs/lab8.dart';
import 'package:lab/Labs/lab9.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> _labData = [];

  @override
  void initState() {
    super.initState();
    _loadLabData();
  }

  void _loadLabData() {
    String labsJSON = '''
{
  "labs": [
    {
      "name": "Lab 1",
      "description": "Android Studio setup for Flutter development with along with Dart SDK"
    },
    {
      "name": "Lab 2",
      "description": "Create a 'Hello Flutter' application"
    },
    {
      "name": "Lab 3",
      "description": "Create an application using Flutter Key Widgets"
    },
    {
      "name": "Lab 4",
      "description": "Create an application using Flutter Key Widgets"
    },
    {
      "name": "Lab 5",
      "description": "Create an application with Flutter UI Components"
    },
    {
      "name": "Lab 6",
      "description": "Create an application with Flutter UI Components"
    },
    {
      "name": "Lab 7",
      "description": "Create an application with Navigation in Flutter"
    },
    {
      "name": "Lab 8",
      "description": "Create an application with list view in Flutter"
    },
    {
      "name": "Lab 9",
      "description": "Create an application with grid view in Flutter"
    },
    {
      "name": "Lab 10",
      "description": "Create an application Crud Operation with SQLite in Flutter"
    },
    {
      "name": "Lab 11",
      "description": "Create an application Connecting to REST API in Flutter"
    },
    {
      "name": "Lab 12",
      "description": "Create an application Parsing JSON data from REST API in Flutter"
    }
  ]
}
''';

    Map<String, dynamic> labsMap = jsonDecode(labsJSON);
    _labData = labsMap['labs'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Labs'),
        actions: [],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _labData.length,
              itemBuilder: (context, index) {
                final labData = _labData[index];
                final labName = labData['name'];
                return Card(
                  child: ListTile(
                    title: Text(
                      labName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(labData['description']),
                    onTap: () {
                      navigateToLab(labName);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void navigateToLab(String labName) {
    switch (labName) {
      case 'Lab 1':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab1()));
        break;
      case 'Lab 2':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab2()));
        break;
      case 'Lab 3':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab3()));
        break;
      case 'Lab 4':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab4()));
        break;
      case 'Lab 5':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab5()));
        break;
      case 'Lab 6':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab6()));
        break;
      case 'Lab 7':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab7()));
        break;
      case 'Lab 8':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab8()));
        break;
      case 'Lab 9':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab9()));
        break;
      case 'Lab 10':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab10()));
        break;
      case 'Lab 11':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab11()));
        break;
      case 'Lab 12':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lab12()));
        break;
    }
  }
}
