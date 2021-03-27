import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CollectionTrackingPage extends StatefulWidget {
  @override
  _CollectionTrackingPageState createState() => _CollectionTrackingPageState();
}

class _CollectionTrackingPageState extends State<CollectionTrackingPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(23.5880, 58.3829);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Live Tracking'),
        automaticallyImplyLeading: false,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
