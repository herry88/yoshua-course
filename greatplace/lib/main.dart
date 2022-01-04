import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMap(),
    );
  }
}

class MainMap extends StatefulWidget {
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  List<Marker> _markers = [];

  void _addMarker(Position pos, String markerId, String markerTitle) {
    final marker = Marker(
      markerId: MarkerId(markerId),
      position: LatLng(pos.latitude, pos.longitude),
      infoWindow: InfoWindow(title: markerTitle),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    );
    _markers.add(marker);
    setState(() {
      _markers = _markers;
    });
  }

  final CameraPosition position = CameraPosition(
    target: LatLng(-6.247140295279409, 106.9247408968094),
    zoom: 12,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Apps'),
      ),
      body: Container(
        child: GoogleMap(
          initialCameraPosition: position,
          markers: Set<Marker>.of(_markers),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          //fuunction get marker
        },
      ),
    );
  }
}
