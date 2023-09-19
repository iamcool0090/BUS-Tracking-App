import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Import the RichAttributionWidget
// Import for launching URLs

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: const LatLng(12.9097, 77.5567),
        zoom: 10,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(12.9097, 77.5567),
              width: 80,
              height: 80,
              builder: (context) => Icon(
                Icons.place,
                color: Colors.red,
              ),
            ),
            Marker(
                point: LatLng(12.904, 77.5175),
                builder: (context) => Icon(
                      Icons.bus_alert,
                      color: Colors.redAccent,
                    ))
          ],
        ),
      ],
    );
  }
}
