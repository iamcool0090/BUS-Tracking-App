import 'package:flutter/material.dart';
import './mapview.dart';
import './scroll_buses.dart';
import './sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Map Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LiveBus'),
      ),
      drawer: const Sidebar(), // Add the Sidebar widget here
      body: Column(
        children: [
          const Expanded(
            child: MapView(), // This will occupy the top half of the screen.
          ),
          Container(
            height: 300, // Adjust the height as needed for the bottom half.
            color: Colors.white, // Color for the bottom half.
            child: const SimpleScrollableList(),
            // Add your widgets for the bottom half here.
          ),
        ],
      ),
    );
  }
}
