import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:darshan_journey/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Schedule the navigation to the next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      // Navigate to the next screen
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const WelcomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color.fromARGB(255, 231, 231, 231),
        // You can customize the splash screen UI here
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 800),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/Splash_logo2.png',
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FadeInRight(
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 800),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/Splash_logo1.png',
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
          ] // Use the path to your image asset
              ),
        ));
  }
}
