import 'package:flutter/material.dart';

class Lab8 extends StatelessWidget {
  const Lab8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: const Key('scaffold_key'),
        appBar: AppBar(
          key: const Key('appbar_key'),
          title: const Text(
            'Lab 8 : Create and application with list view in Flutter.',
            style: TextStyle(fontSize: 18),
          ),
          leading: IconButton(
            key: const Key('back_button_key'),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListViewExample(),
      ),
    );
  }
}

class ListViewExample extends StatelessWidget {
  final List<String> items =
      List<String>.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            title: Text(
              items[index],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: Colors.grey[200],
            onTap: () {
              print('Tapped on ${items[index]}');
            },
          ),
        );
      },
    );
  }
}
