import 'package:flutter/material.dart';

class Lab3 extends StatelessWidget {
  const Lab3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: const Key('scaffold_key'),
        appBar: AppBar(
          key: const Key('appbar_key'),
          title: const Text(
            'Lab 3 :  Create an application using Flutter Key Widgets.',
            style: TextStyle(fontSize: 18),
          ),
          leading: IconButton(
            key: const Key('back_button_key'),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              key: const Key('text1_key'),
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Rich Text: ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Krupesh ',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  TextSpan(
                    text: 'Vachhani',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'DancingScript',
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  key: const Key('container_key'),
                  color: Colors.blue,
                  padding: const EdgeInsets.all(40),
                  child: const Center(
                    child: Text(
                      'Container Text',
                      key: Key('container_text_key'),
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  key: Key('elevated_button_2_key'),
                  onPressed: () {
                    // Add your button action here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 209, 136, 218),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    'Elevated Button 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 20),
                TextButton(
                  key: Key('text_button_key'),
                  onPressed: () {
                    // Add your button action here
                  },
                  child: const Text('Text Button'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  key: Key('outlined_button_key'),
                  onPressed: () {
                    // Add your button action here
                  },
                  child: const Text('Outlined Button'),
                ),
                SizedBox(width: 20),
                IconButton(
                  key: Key('icon_button_2_key'),
                  onPressed: () {
                    // Add your button action here
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              key: Key('fab_key'),
              onPressed: () {
                // Add your button action here
              },
              child: const Icon(Icons.add),
            ),
            SizedBox(height: 20),
            GestureDetector(
              key: Key('custom_button_key'),
              onTap: () {
                // Add your button action here
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Custom Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
