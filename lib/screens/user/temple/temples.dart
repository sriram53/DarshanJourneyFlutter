import 'package:flutter/material.dart';

class TempleScreen extends StatefulWidget {
  const TempleScreen({super.key});

  @override
  State<TempleScreen> createState() => _TempleScreenState();
}

class _TempleScreenState extends State<TempleScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Temples'),
    );
  }
}


