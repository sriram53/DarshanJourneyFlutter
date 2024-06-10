// ignore_for_file: deprecated_member_use

import 'package:darshan_journey/screens/user/login_screen.dart';
import 'package:darshan_journey/screens/user/menubar/profile.dart';
import 'package:flutter/material.dart';

import '../settings/user_settings.dart';
import 'events.dart';
import 'help.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const NavBar({Key? key});

  void _launchURL() async {
    const url = 'https://www.bookswagon.com/aboutus';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          0.75, // Adjust the width as needed
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 60,
                  bottom: 10,
                  right: 10,
                  left: 20), // Adjust the padding as needed
              color:
                  Colors.amber[700], // Set your desired background color here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                                "https://w7.pngwing.com/pngs/86/421/png-transparent-computer-icons-user-profile-set-of-abstract-icon-miscellaneous-monochrome-computer-wallpaper.png"),
                          ),
                        ),
                      ),
                      Material(
                        shape: CircleBorder(),
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors
                                .orangeAccent, // Set your desired background color here
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                            color: Colors.white, // Set your desired icon color
                            onPressed: () {
                              Navigator.pop(
                                context
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add some space between the rows
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 0, bottom: 0, top: 0),
                    child: Text(
                      'Arun', // Add your title text here
                      style: TextStyle(
                        color:
                            Colors.white, // Set your desired title text color
                        fontSize: 20, // Set your desired title text size
                        fontWeight: FontWeight
                            .bold, // Set your desired title text weight
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text(
                'My Profile',
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold, // Set your desired title text weight
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyProfileScreen()), // Corrected the syntax
                );
                // Navigate to Page Two
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                color: Colors.amber[700],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.widgets),
              title: const Text(
                'My Booking',
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold, // Set your desired title text weight
                ),
              ),
              onTap: () {
                // Navigate to Page One
              },
            ),
            ListTile(
              leading: const Icon(Icons.event_available_outlined),
              title: const Text(
                'Events',
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold, // Set your desired title text weight
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EventHomePage()), // Corrected the syntax
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                color: Colors.amber[700],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text(
                'About',
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold, // Set your desired title text weight
                ),
              ),
              onTap: _launchURL,
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text(
                'Terms and Privacy Policy',
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold, // Set your desired title text weight
                ),
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //            const HoverContainer()), // Corrected the syntax
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline_sharp),
              title: const Text(
                'Help',
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold, // Set your desired title text weight
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HelpScreen()), // Corrected the syntax
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold, // Set your desired title text weight
                ),
              ),
              onTap: () {
                // Navigate to Page Two
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SettingsScreen()), // Corrected the syntax
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                color: Colors.amber[700],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold, // Set your desired title text weight
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginPage()), // Corrected the syntax
                );
                // Navigate to Page Two
              },
            ),
          ],
        ),
      ),
    );
  }
}
