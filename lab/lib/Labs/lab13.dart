import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Lab13 extends StatelessWidget {
  const Lab13({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Button',
      home: LocationButton(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LocationButton extends StatefulWidget {
  @override
  _LocationButtonState createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton> {
  String _location = 'Getting location...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lab 13: Create and application using Hardware Interaction in Flutter.',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Request location permission for Android
            final status = await Permission.location.request();
            if (status.isGranted) {
              // Get the user's current location
              Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high,
              );
              setState(() {
                _location =
                    'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
              });
            } else {
              setState(() {
                _location = 'Location permission denied';
              });
            }
          },
          child: Text(_location),
        ),
      ),
    );
  }
}
