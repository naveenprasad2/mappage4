import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mappage4/views/drawer_view.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": 'Tambaram'},
    {"id": 2, "name": 'T nagar'},
    {"id": 3, "name": 'Chrompet'},
    {"id": 4, "name": 'Pallavarm'},
    {"id": 5, "name": 'Palikarani'},
    {"id": 6, "name": 'Avadi'},
    {"id": 7, "name": 'Nugampakam'},
    {"id": 8, "name": 'Karapakam'},
    {"id": 9, "name": 'Sanitorium'},
    {"id": 10, "name": 'Kilambakam'},
  ];



  List<Map<String, dynamic>> _foundUsers = [];
  TextEditingController _controller = TextEditingController();
  TextEditingController _dropController = TextEditingController();
  bool _showSuggestions = false;

  Location _locationController = Location();
  LatLng? _currentP;
  LatLng? _pDestination;
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
    getLocationUpdate();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
      _showSuggestions = true; // Show suggestions when filtering
    });
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

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 13);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
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
        polylineCoordinates
            .map((e) => e.latitude)
            .reduce((a, b) => a < b ? a : b),
        polylineCoordinates
            .map((e) => e.longitude)
            .reduce((a, b) => a < b ? a : b),
      );
      LatLng northeast = LatLng(
        polylineCoordinates
            .map((e) => e.latitude)
            .reduce((a, b) => a > b ? a : b),
        polylineCoordinates
            .map((e) => e.longitude)
            .reduce((a, b) => a > b ? a : b),
      );
      bounds = LatLngBounds(southwest: southwest, northeast: northeast);
    }

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    controller.animateCamera(cameraUpdate);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        drawer: MenuPage(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(240),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.yellow[700],
            flexibleSpace: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 320,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _controller,
                            onChanged: (value) => _runFilter(value),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 12),
                              border: InputBorder.none,
                              hintText: 'Current location',
                              prefixIcon:
                                  Icon(Icons.directions_bike, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 65,top: 30),
                      child: Container(
                        height: 50,
                        width: 320,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _dropController ,
                          onChanged: (value) => _runFilter(value),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 12),
                            border: InputBorder.none,
                            hintText: 'Drop location',
                            prefixIcon: Icon(Icons.pin_drop, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    if (_showSuggestions && _foundUsers.isNotEmpty)
                      Container(

                        height: 100,
                        color: Colors.yellow[700],
                        child: ListView.builder(
                          itemCount: _foundUsers.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(left: 65,bottom: 15.0),
                                child: Text(_foundUsers[index]['name'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                              ),
                              onTap: () {
                                setState(() {
                                  _dropController.text = _foundUsers[index]['name'];
                                  _showSuggestions = false;
                                  }
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ]),
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
                zoom: 5,
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
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue),
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
          ],
        ),
      ),
    );
  }
}
