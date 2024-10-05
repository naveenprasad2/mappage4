import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mappage4/splash_screen.dart';
import 'package:mappage4/views/book_ride_screen.dart';
import 'package:mappage4/views/feedback_view.dart';
import 'package:mappage4/views/otp_ride_conformation_view.dart';
import 'package:mappage4/views/payment_view.dart';

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
      home: OtpConformationPage(),
    );
  }
}
