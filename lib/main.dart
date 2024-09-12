import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mappage4/splash_screen.dart';
import 'package:mappage4/views/drawer_view.dart';
import 'mappage.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );
  }
}
