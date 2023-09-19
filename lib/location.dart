import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Location'),
      ),
      body: Center(
        // ignore: unnecessary_null_comparison
        child: _currentPosition != null
            ? Text(
                'Latitude: ${_currentPosition.latitude}, Longitude: ${_currentPosition.longitude}',
                style: const TextStyle(fontSize: 18),
              )
            : const CircularProgressIndicator(), // Show a loading indicator until location is fetched.
      ),
    );
  }
}
