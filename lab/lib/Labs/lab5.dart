import 'package:flutter/material.dart';

class Lab5 extends StatelessWidget {
  const Lab5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Effect',
      home: ScrollEffectScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScrollEffectScreen extends StatefulWidget {
  @override
  _ScrollEffectScreenState createState() => _ScrollEffectScreenState();
}

class _ScrollEffectScreenState extends State<ScrollEffectScreen> {
  final List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
  ];
  final List<String> _screenNames = [
    'Screen 1',
    'Screen 2',
    'Screen 3',
    'Screen 4',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lab 5: Create an application with Flutter UI Components.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: _colors[_currentIndex], // Set background color
      ),
      body: Stack(
        children: [
          // PageView for scrolling content
          PageView.builder(
            scrollDirection: Axis.vertical,
            controller: PageController(viewportFraction: 1),
            itemCount: _colors.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                color: _colors[index],
                child: Center(
                  child: Text(
                    _screenNames[index],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),

          // Text message at the bottom
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Text(
                _currentIndex == 0 ? 'Swipe Down' : 'Swipe Up & Down',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
