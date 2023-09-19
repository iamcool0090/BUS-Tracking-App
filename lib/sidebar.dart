import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'find_a_bus.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 85.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'LiveBus',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Add your home page navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Find Bus'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchPageDemo()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text("Get Location"),
            onTap: () async {
              try {
                Position position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high,
                );
                print(
                    'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
              } catch (e) {
                print(e);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About Us"),
            onTap: () {},
          ),

          Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                "FOSSKannada 2023",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))

          // Add more list items for other menu options
        ],
      ),
    );
  }
}
