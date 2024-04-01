import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Lab11());
}

class Lab11 extends StatelessWidget {
  const Lab11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Fact API Example',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CatFact? catFact;

  @override
  void initState() {
    super.initState();
    fetchCatFact();
  }

  Future<void> fetchCatFact() async {
    try {
      final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          catFact = CatFact.fromJson(jsonData);
        });
      } else {
        throw Exception('Failed to load cat fact');
      }
    } catch (e) {
      print('Failed to fetch cat fact: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lab 11: Create and application Connecting to REST API in Flutter.',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: catFact == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      catFact!.fact,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Length: ${catFact!.length}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CatFact {
  final String fact;
  final int length;

  CatFact({
    required this.fact,
    required this.length,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      fact: json['fact'],
      length: json['length'],
    );
  }
}
