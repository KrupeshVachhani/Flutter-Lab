import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

class Lab10 extends StatelessWidget {
  const Lab10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  List<Map<String, dynamic>> _records = [];

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final database = await openDatabase(
      'records.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE records (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
        );
      },
    );

    final records = await database.query('records');
    setState(() {
      _records =
          records.map((record) => Map<String, dynamic>.from(record)).toList();
    });
  }

  Future<void> _addRecord() async {
    final database = await openDatabase('records.db');
    final name = _nameController.text;
    final age = int.tryParse(_ageController.text) ?? 0;

    await database.insert(
      'records',
      {'name': name, 'age': age},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    final jsonData = json.encode({'name': name, 'age': age});
    print('Added record: $jsonData');

    _nameController.clear();
    _ageController.clear();

    final records = await database.query('records');
    setState(() {
      _records =
          records.map((record) => Map<String, dynamic>.from(record)).toList();
    });
  }

  Future<void> _removeRecord(int id) async {
    final database = await openDatabase('records.db');

    await database.delete(
      'records',
      where: 'id = ?',
      whereArgs: [id],
    );

    final records = await database.query('records');
    setState(() {
      _records =
          records.map((record) => Map<String, dynamic>.from(record)).toList();
    });
  }

  Future<void> _showRecords() async {
    if (_records.isNotEmpty) {
      String recordsText = '';
      for (var record in _records) {
        recordsText += 'Name: ${record['name']}, Age: ${record['age']}\n';
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Records'),
          content: Text(recordsText),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('No Records'),
          content: Text('There are no records to display.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lab 10: Create and application Crud Operation with SQLite in Flutter.',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addRecord,
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: _showRecords,
                  child: Text('Show'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _records.length,
                itemBuilder: (context, index) {
                  final record = _records[index];
                  return Card(
                    child: ListTile(
                      title: Text(record['name']),
                      subtitle: Text('Age: ${record['age']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeRecord(record['id']),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
