// import 'package:flutter/material.dart';
//
// class RideBookingPage extends StatefulWidget {
//   @override
//   _RideBookingPageState createState() => _RideBookingPageState();
// }
//
// class _RideBookingPageState extends State<RideBookingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         toolbarHeight: 0,
//       ),
//       body: Stack(
//         children: [
//           Container(
//             height: 360,
//             child: Image.asset(
//               'assets/screenshot.JPG',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             top: 300,
//             left: 18,
//             child: CircleAvatar(
//               backgroundColor: Colors.white,
//               radius: 20,
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () {},
//               ),
//             ),
//           ),
//           Positioned(
//             top: 300,
//             right: 18,
//             child: CircleAvatar(
//               backgroundColor: Colors.white,
//               radius: 20,
//               child: IconButton(
//                 icon: Icon(Icons.my_location_outlined, color: Colors.blue),
//                 onPressed: () {},
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: RideOptions(),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class RideOptions extends StatefulWidget {
//   @override
//   _RideOptionsState createState() => _RideOptionsState();
// }
//
// class _RideOptionsState extends State<RideOptions> {
//   String? selectedRide;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             height: 380,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15),
//                 topRight: Radius.circular(15),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 5.0,
//                 ),
//               ],
//             ),
//             child: ListView(
//               padding: EdgeInsets.all(10),
//               children: [
//                 RideOptionTile(
//                   imagePath: 'assets/Bike.jpg',
//                   title: 'Bike',
//                   icon: Icons.person,
//                   number: 1,
//                   subtitle: 'Quick Bike rides',
//                   price: '₹211',
//                   time: '4 mins away • Drop 11:29 am',
//                   isFastest: true,
//                   isSelected: selectedRide == 'Bike',
//                   onTap: () {
//                     setState(() {
//                       selectedRide = 'Bike';
//                     });
//                   },
//                 ),
//                 RideOptionTile(
//                   imagePath: 'assets/auto.jpg',
//                   title: 'Auto',
//                   icon: Icons.person,
//                   number: 3,
//                   subtitle: 'Hassle-free Auto rides',
//                   price: '₹268',
//                   time: '4 mins • Drop 11:35 am',
//                   isSelected: selectedRide == 'Auto',
//                   onTap: () {
//                     setState(() {
//                       selectedRide = 'Auto';
//                     });
//                   },
//                 ),
//                 RideOptionTile(
//                   imagePath: 'assets/cab.jpg',
//                   title: 'Cab Economy',
//                   icon: Icons.person,
//                   number: 4,
//                   subtitle: 'Affordable car rides',
//                   price: '₹420',
//                   oldPrice: '₹490',
//                   time: '4 mins • Drop 11:35 am',
//                   isSelected: selectedRide == 'Cab Economy',
//                   onTap: () {
//                     setState(() {
//                       selectedRide = 'Cab Economy';
//                     });
//                   },
//                 ),
//                 RideOptionTile(
//                   imagePath: 'assets/cab_premium.jpg',
//                   title: 'Cab Premium',
//                   icon: Icons.person,
//                   number: 4,
//                   subtitle: 'Comfortable sedan rides',
//                   price: '₹479',
//                   time: '4 mins • Drop 11:35 am',
//                   isSelected: selectedRide == 'Cab Premium',
//                   onTap: () {
//                     setState(() {
//                       selectedRide = 'Cab Premium';
//                     });
//                   },
//                 ),
//                 Container(
//                   height: 160,
//                   padding: EdgeInsets.only(top: 15),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 20.0,
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10.0),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.currency_rupee_outlined,
//                                   color: Colors.blue,
//                                 ),
//                                 SizedBox(width: 5),
//                                 Text(
//                                   'Cash',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 SizedBox(width: 70),
//                                 Icon(
//                                   Icons.arrow_forward_ios_outlined,
//                                   size: 15,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.local_offer_outlined,
//                                 color: Colors.green,
//                               ),
//                               SizedBox(width: 5),
//                               Text(
//                                 'Offers',
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                               SizedBox(width: 90),
//                               Icon(
//                                 Icons.arrow_forward_ios_outlined,
//                                 size: 15,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 25),
//                       Row(
//                         children: [
//                           Padding(
//                             padding:
//                             const EdgeInsets.only(right: 15.0, left: 10),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 25,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     color: Colors.black26,
//                                     width: 1.0,
//                                   ),
//                                 ),
//                                 child: IconButton(
//                                   icon: Icon(Icons.edit_calendar,
//                                       color: Colors.blue[900]),
//                                   onPressed: () {},
//                                 ),
//                               ),
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.yellow[700],
//                               minimumSize: Size(250, 50),
//                             ),
//                             child: Text(
//                               'Book ${selectedRide ?? 'Bike'}',
//                               style:
//                               TextStyle(fontSize: 15, color: Colors.black),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class RideOptionTile extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final IconData icon;
//   final int number;
//   final String price;
//   final String? oldPrice;
//   final String time;
//   final String subtitle;
//   final bool isFastest;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const RideOptionTile({
//     Key? key,
//     required this.imagePath,
//     required this.title,
//     required this.icon,
//     required this.number,
//     required this.price,
//     required this.time,
//     this.oldPrice,
//     required this.subtitle,
//     this.isFastest = false,
//     required this.isSelected,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//             color: isSelected ? Colors.white : Colors.transparent,
//             borderRadius: BorderRadius.circular(10),
//             border:
//             isSelected ? Border.all(color: Colors.black, width: 1) : null,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 20,
//                       child: ClipOval(
//                         child: Image.asset(
//                           imagePath,
//                           width: 30,
//                           height: 30,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               title,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(width: 5),
//                             if (isSelected)
//                               Icon(icon, size: 12, color: Colors.black87),
//                             if (isSelected)
//                               if (number != null)
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 2.0),
//                                   child: Text(
//                                     number.toString(),
//                                     style: TextStyle(
//                                       color: Colors.black87,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ),
//                             if (isFastest)
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 8.0),
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 5, vertical: 2),
//                                   decoration: BoxDecoration(
//                                     color: Colors.green[100],
//                                     borderRadius: BorderRadius.circular(5),
//                                   ),
//                                   child: Text(
//                                     'FASTEST',
//                                     style: TextStyle(
//                                       color: Colors.black87,
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         ),
//                         if (isSelected)
//                           Text(
//                             subtitle,
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         Text(
//                           time,
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(
//                       price,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     if (oldPrice != null)
//                       Text(
//                         oldPrice!,
//                         style: TextStyle(
//                           color: Colors.grey,
//                           decoration: TextDecoration.lineThrough,
//                         ),
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mappage4/mappage.dart';
import 'book_ride_screen.dart';

class RideBookingPage extends StatefulWidget {
  const RideBookingPage({Key? key}) : super(key: key);

  @override
  State<RideBookingPage> createState() => _RideBookingPageState();
}

class _RideBookingPageState extends State<RideBookingPage> {
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
             top: 490,
             left: 20,
            child: CircleAvatar(
               backgroundColor: Colors.white,
               radius: 20,
               child: IconButton(
                 icon: Icon(Icons.arrow_back, color: Colors.black),
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
                 },
               ),
             ),
           ),
           Positioned(
             top: 490,
             right: 20,
             child: CircleAvatar(
               backgroundColor: Colors.white,
               radius: 20,
               child: IconButton(
                 icon: Icon(Icons.my_location_outlined, color: Colors.blue),
                 onPressed: () {},
               ),
             ),
           ),
           Align(
             alignment: Alignment.bottomCenter,
             child: RideOptions(),
           ),
                 ],
      ),
    );
  }
}

class RideOptions extends StatefulWidget {
  @override
  _RideOptionsState createState() => _RideOptionsState();
}

class _RideOptionsState extends State<RideOptions> {
  String? selectedRide;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height * 0.48,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            children: [
              RideOptionTile(
                imagePath: 'lib/assets/Bike.jpg',
                title: 'Bike',
                icon: Icons.person,
                number: 1,
                subtitle: 'Quick Bike rides',
                price: '₹211',
                time: '4 mins away • Drop 11:29 am',
                isFastest: true,
                isSelected: selectedRide == 'Bike',
                onTap: () {
                  setState(() {
                    selectedRide = 'Bike';
                  });
                },
              ),
              RideOptionTile(
                imagePath: 'lib/assets/auto.jpg',
                title: 'Auto',
                icon: Icons.person,
                number: 3,
                subtitle: 'Hassle-free Auto rides',
                price: '₹268',
                time: '4 mins • Drop 11:35 am',
                isSelected: selectedRide == 'Auto',
                onTap: () {
                  setState(() {
                    selectedRide = 'Auto';
                  });
                },
              ),
              RideOptionTile(
                imagePath: 'lib/assets/cab.jpg',
                title: 'Cab Economy',
                icon: Icons.person,
                number: 4,
                subtitle: 'Affordable car rides',
                price: '₹420',
                oldPrice: '₹490',
                time: '4 mins • Drop 11:35 am',
                isSelected: selectedRide == 'Cab Economy',
                onTap: () {
                  setState(() {
                    selectedRide = 'Cab Economy';
                  });
                },
              ),
              RideOptionTile(
                imagePath: 'lib/assets/cab_premium.jpg',
                title: 'Cab Premium',
                icon: Icons.person,
                number: 4,
                subtitle: 'Comfortable sedan rides',
                price: '₹479',
                time: '4 mins • Drop 11:35 am',
                isSelected: selectedRide == 'Cab Premium',
                onTap: () {
                  setState(() {
                    selectedRide = 'Cab Premium';
                  });
                },
              ),
              Container(
                //height: 180,
                padding: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.currency_rupee_outlined,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Cash',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(width: 70),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_offer_outlined,
                              color: Colors.green,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Offers',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(width: 90),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    /*Row(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(right: 15.0, left: 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.edit_calendar,
                                    color: Colors.blue[900]),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BookRideScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[700],
                            minimumSize: Size(300, 50),
                          ),
                          child: Text(
                            'Book ${selectedRide ?? 'Bike'}',
                            style:
                            TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    )*/
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookRideScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[600],
                        minimumSize: Size(300, 50),
                      ),
                      child: Text(
                        'Book ${selectedRide ?? 'Bike'}',
                        style:
                        TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RideOptionTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final IconData icon;
  final int number;
  final String price;
  final String? oldPrice;
  final String time;
  final String subtitle;
  final bool isFastest;
  final bool isSelected;
  final VoidCallback onTap;

  const RideOptionTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.icon,
    required this.number,
    required this.price,
    required this.time,
    this.oldPrice,
    required this.subtitle,
    this.isFastest = false,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border:
            isSelected ? Border.all(color: Colors.black, width: 1) : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: ClipOval(
                        child: Image.asset(
                          imagePath,
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            if (isSelected)
                              Icon(icon, size: 12, color: Colors.black87),
                            if (isSelected)
                              if (number != null)
                                Padding(
                                  padding: const EdgeInsets.only(right: 2.0),
                                  child: Text(
                                    number.toString(),
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            if (isFastest)
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    'FASTEST',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (isSelected)
                          Text(
                            subtitle,
                            style: TextStyle(color: Colors.grey),
                          ),
                        Text(
                          time,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (oldPrice != null)
                      Text(
                        oldPrice!,
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

