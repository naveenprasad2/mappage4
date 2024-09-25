import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mappage4/splash_screen.dart';
import 'package:mappage4/views/conform_ride_view.dart';
import 'package:mappage4/views/drawer_view.dart';
import 'package:mappage4/views/trip_details_view.dart';
//import 'assets/search_history.dart';
import 'mappage.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      home: ConformView(),

    );
  }
}
