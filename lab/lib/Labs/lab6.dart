import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Lab6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: _isDarkMode ? Colors.black : Colors.white,
          systemNavigationBarColor: _isDarkMode ? Colors.black : Colors.white,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dark & Light Mode App',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  const MyHomePage({required this.isDarkMode, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark & Light Mode'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Unique UI element: Curved Container with Text
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[800] : Colors.blue[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                'Changing Dark & Light Mode in Flutter!',
                style: TextStyle(
                  fontSize: 18.0,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Unique UI element: Gradient Button with dynamic icon
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor:
                    isDarkMode ? Colors.blueAccent : Colors.lightBlue,
              ),
              onPressed: () => toggleTheme(),
              child: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: Colors.white, // Ensure icon color stays white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
