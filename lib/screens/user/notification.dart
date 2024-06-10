import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.white,
          iconTheme: const IconThemeData(
          color:  Color(0xFF835DF1), // Change the color of the back arrow here
        ),
        title: const Text(
          'Notification',
        style: TextStyle(color: Colors.black),),
      ),
      backgroundColor:Colors.white,
      body: SizedBox(

        width: MediaQuery.of(context).size.width * 0.75,
        child: const Text('hello'),
      ));
  }
}