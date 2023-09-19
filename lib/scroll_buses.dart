import 'package:flutter/material.dart';

class SimpleScrollableList extends StatelessWidget {
  const SimpleScrollableList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // The number of items in the list
      itemBuilder: (context, index) {
        // The itemBuilder callback is called for each item in the list
        return const ListTile(
            textColor: Colors.black,
            focusColor: Colors.blue,
            leading: Text(
              "210N",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "12:38 PM",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.white),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.directions_bus)
              ],
            ));
      },
    );
  }
}
