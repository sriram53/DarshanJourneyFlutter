import 'package:darshan_journey/screens/user/login_screen.dart';
import 'package:flutter/material.dart';


class VendorNavBar extends StatelessWidget {
    // ignore: use_key_in_widget_constructors
    const VendorNavBar({Key? key});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75, // Adjust the width as needed
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
            accountName: Text('Arun'),
            accountEmail: Text('9876543210'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'A',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),

            ListTile(
              leading: const Icon(Icons.widgets),
              title: const Text('My Order'),
              onTap: () {
                // Navigate to Page One
              },
            ),
            ListTile(
              leading: const Icon(Icons.beenhere),
              title:const Text('Iyer Booking'),
              onTap: () {
                // Navigate to Page Two
              },
            ),
            ListTile(
              leading: const Icon(Icons.event_available_outlined),
              title:const Text('Events'),
              onTap: () {
                // Navigate to Page Two
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title:const Text('About'),
              onTap: () {
                // Navigate to Page Two
              },
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title:const Text('Privacy Policy'),
              onTap: () {
                // Navigate to Page Two
              },
            ),
            ListTile(
              leading: const Icon(Icons.rate_review),
              title:const Text('Feedback'),
              onTap: () {
                // Navigate to Page Two
                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => const FeedbackForm()), // Corrected the syntax
               // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title:const Text('Settings'),
              onTap: () {
                // Navigate to Page Two
              },
            ),
            // const SizedBox(
            //     height: 100,
            // ),
            ListTile(
              leading: const Icon(Icons.power_settings_new),
              title:const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()), // Corrected the syntax
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
