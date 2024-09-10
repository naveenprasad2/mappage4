import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Location _locationController = Location();
  LatLng? _currentP;
  LatLng? _pDestination;
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdate();
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 13);
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdate() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<void> setPolyline(LatLng destination) async {
    if (_currentP == null || destination == null) return;

    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    String API_KEY = "YOUR_API_KEY";

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      API_KEY,
      PointLatLng(_currentP!.latitude, _currentP!.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      generatePolyLineFromPoints(polylineCoordinates);
      _cameraToPolyLine(polylineCoordinates);
    } else {
      print('Error: ${result.errorMessage}');
    }
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.black,
      points: polylineCoordinates,
      width: 5,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }

  Future<void> _cameraToPolyLine(List<LatLng> polylineCoordinates) async {
    if (polylineCoordinates.isEmpty) return;

    final GoogleMapController controller = await _mapController.future;

    LatLngBounds bounds;
    if (polylineCoordinates.length == 1) {
      bounds = LatLngBounds(
        southwest: polylineCoordinates.first,
        northeast: polylineCoordinates.first,
      );
    } else {
      LatLng southwest = LatLng(
        polylineCoordinates.map((e) => e.latitude).reduce((a, b) => a < b ? a : b),
        polylineCoordinates.map((e) => e.longitude).reduce((a, b) => a < b ? a : b),
      );
      LatLng northeast = LatLng(
        polylineCoordinates.map((e) => e.latitude).reduce((a, b) => a > b ? a : b),
        polylineCoordinates.map((e) => e.longitude).reduce((a, b) => a > b ? a : b),
      );
      bounds = LatLngBounds(southwest: southwest, northeast: northeast);
    }

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    controller.animateCamera(cameraUpdate);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75), 
        child: AppBar(
          backgroundColor: Colors.yellow[700],
          flexibleSpace: Container(

            child: Padding(
              padding:  EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),

                  Container(
                    height: 50,
                    width: 320,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Pickup location',
                         prefixIcon: Icon(Icons.directions_bike, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(12.922915, 80.127457),
              zoom: 15,
            ),
            markers: {
              if (_currentP != null)
                Marker(
                  markerId: MarkerId("_currentlocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _currentP!,
                ),
              if (_pDestination != null)
                Marker(
                  markerId: MarkerId("_destinationLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pDestination!,
                ),
            },
            polylines: Set<Polyline>.of(polylines.values),
            onTap: (LatLng tappedPosition) {
              setState(() {
                _pDestination = tappedPosition;
              });
              setPolyline(tappedPosition);
            },
          ),
          Positioned(
            bottom: 1,
            child: Container(
              height: 180,
              width: width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                color: Colors.yellow[700]?.withOpacity(0.8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 380,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Drop location',
                           prefixIcon: Icon(Icons.pin_drop, color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 380,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Book Ride')))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
