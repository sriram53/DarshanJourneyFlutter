
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


import '../menubar/sidemenu.dart';
import 'feedback.dart';
import 'settingtitle.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  void _toggleNotification() {
    setState(() {
      _notificationsEnabled = !_notificationsEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Icon for the back arrow
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NavBar())); // Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              SettingsTile(
                color: Colors.green,
                icon: Ionicons.pencil_outline,
                title: "Notification",
                onTap: _toggleNotification,
                enabled: _notificationsEnabled,
              ),

              const SizedBox(
                height: 10,
              ),
              // SettingsTile(
              //   color: Colors.black,
              //   icon: Ionicons.shield_half_outline,
              //   title: "Privacy Policy",
              //   onTap: () {},
              // ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.purple,
                icon: Ionicons.chatbox_ellipses_outline,
                title: "Feedback",
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const FeedbackForm()), // Corrected the syntax
                );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // SettingsTile(
              //   color: Colors.red,
              //   icon: Ionicons.newspaper,
              //   title: "Terms and Condition",
              //   onTap: () {},
              // ),
              // const SizedBox(
              //   height: 40,
              // ),
              // SettingsTile(
              //   color: Colors.red,
              //   icon: Ionicons.log_out_outline,
              //   title: "Logout",
              //   onTap: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}