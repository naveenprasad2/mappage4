import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mappage4/views/onboarding_view.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnboardingView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:
      Image.asset('lib/assets/karki.png'),
      curve: Curves.bounceOut,
      splashTransition: SplashTransition.sizeTransition,
      centered: true,
      splashIconSize: 200,
      duration: 2500,
      nextScreen:  OnboardingView(),
    );
  }
}