import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'screens/controllers/auth.dart';
import 'screens/splash_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, Orientation, DeviceType) =>
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Satoshi',

        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        // Define light mode theme data here
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // Define dark mode theme data here
      ),
        home: const SplashScreen(),
      ),
    );
  }
}


// Check Session Page
class CheckSession extends StatefulWidget {
  const CheckSession({super.key});

  @override
  State<CheckSession> createState() => _CheckSessionState();
}

class _CheckSessionState extends State<CheckSession> {
  @override
  void initState() {
    checkSessions().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.restorablePushReplacementNamed(context, "/login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

