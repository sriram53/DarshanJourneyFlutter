import 'package:darshan_journey/screens/vendor/vendor_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import 'user/bottom_nav/bottom_nav.dart';
import 'welcome.dart';

class UserVendor extends StatefulWidget {
  const UserVendor({super.key});

  @override
  State<UserVendor> createState() => _UserVendorState();
}

class _UserVendorState extends State<UserVendor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/images/user_vendor.jpg"), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios), // Icon for the back arrow
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const WelcomePage())); // Navigate back when pressed
            },
          ),
          iconTheme: const IconThemeData(
            color: Color(0xFF835DF1), // Change the color of the back arrow here
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 25.w, // Adjust width according to your requirement
                        height: 25.w, // Adjust height according to your requirement
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue, // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/user.png',
                            width: 25.w,
                            height: 25.w,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                        BottomNavigationBar1()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Satoshi'),
                          backgroundColor: const Color(0xFF835DF1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                        ),
                        child: const Text(
                          'User',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30), // Add space between the columns
                  // Second Image with Text Button
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 25.w, // Adjust width according to your requirement
                        height: 25.w, // Adjust height according to your requirement
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue, // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/vendor.png',
                            width: 25.w,
                            height: 25.w,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const VendorLogin()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Satoshi'),
                          backgroundColor: const Color(0xFF835DF1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                        ),
                        child: const Text(
                          'Vendor',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
