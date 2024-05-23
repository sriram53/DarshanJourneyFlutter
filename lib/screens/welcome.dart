import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'user_vendor.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home :Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              FadeInDown(
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 800),
                child: Container(
                 // color: Color.fromARGB(255, 85, 85, 85),
                  //color: Colors.whit,
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/Splash_logo3.png',
                      width: 100.w,
                      height: 50.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      padding: EdgeInsets.symmetric(horizontal: 1.6.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInUp(
                            delay: const Duration(milliseconds: 700),
                            duration: const Duration(milliseconds: 800),
                            child: Text(
                              "Welcome to Darshan Journey!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25.sp, fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 1000),
                      duration: const Duration(milliseconds: 1100),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const UserVendor(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Satoshi'),
                                backgroundColor: const Color(0xFF835DF1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: FadeInUp(
                                  delay: const Duration(milliseconds: 1100),
                                  duration: const Duration(milliseconds: 1200),
                                  child: const Text("Get Started",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),)),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          )
            ),
        ),
      ),
    );
  }
}
