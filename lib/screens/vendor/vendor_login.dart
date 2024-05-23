import 'package:animate_do/animate_do.dart';
import 'package:darshan_journey/screens/vendor/vendor_register.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

import 'home.dart';

class VendorLogin extends StatefulWidget {
  const VendorLogin({super.key});

  @override
  State<VendorLogin> createState() => _VendorLoginState();
}

class _VendorLoginState extends State<VendorLogin> {
  var focusNodeEmail = FocusNode();
  var focusNodePassword = FocusNode();


  bool isFocusedEmail = false;
  bool isFocusedPassword = false;
  bool personalData = true;

  @override
  void initState() {
    focusNodeEmail.addListener(() {
      setState(() {
        isFocusedEmail = focusNodeEmail.hasFocus;
      });
    });
    super.initState();
    focusNodePassword.addListener(() {
      setState(() {
        isFocusedPassword = focusNodePassword.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                height: 100.h,
                decoration: const BoxDecoration(color: Colors.white),
                padding: EdgeInsets.symmetric(
                  horizontal: 7.w,
                  vertical: 2.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 900),
                      duration: const Duration(milliseconds: 1000),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          IconlyBroken.arrow_left,
                          size: 3.6.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInDown(
                            delay: const Duration(milliseconds: 800),
                            duration: const Duration(milliseconds: 900),
                            child: Text(
                              "Let's Sign You In",
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          FadeInDown(
                            delay: const Duration(milliseconds: 700),
                            duration: const Duration(milliseconds: 800),
                            child: Text(
                              "Welcome Back.",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          FadeInDown(
                            delay: const Duration(milliseconds: 600),
                            duration: const Duration(milliseconds: 700),
                            child: Text(
                              "You've been missed.....!",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Form(
                      child: Container(
                        child: FadeInDown(
                          delay: const Duration(milliseconds: 700),
                          duration: const Duration(milliseconds: 800),
                          child: const Text(
                            "Email or Phone Number",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 0.8.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: .3.h),
                        decoration: BoxDecoration(
                          color: isFocusedEmail
                              ? Colors.white
                              : const Color(0xFFF1F0F5),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFD2D2D4),
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            if (isFocusedEmail)
                              BoxShadow(
                                color: const Color(0xFF835DF1).withOpacity(.3),
                                blurRadius: 4.0,
                                spreadRadius: 2.0,

                                //glow color
                              ),
                          ],
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email or Phone Number';
                            }
                            return null;
                          },
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Your Email or Phone Number",
                          ),
                          focusNode: focusNodeEmail,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 600),
                      child: const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 400),
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 0.8.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: .3.h),
                        decoration: BoxDecoration(
                          color: isFocusedEmail
                              ? Colors.white
                              : const Color(0xFFF1F0F5),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFD2D2D4),
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            if (isFocusedPassword)
                              BoxShadow(
                                color: const Color(0xFF835DF1).withOpacity(.3),
                                blurRadius: 4.0,
                                spreadRadius: 2.0,

                                //glow color
                              ),
                          ],
                        ),
                        child: TextFormField(
                          controller: passwordcontroller,
                          obscureText: true,
                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Phone number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey,
                              size: 16.sp,
                            ),
                            border: InputBorder.none,
                            hintText: "Enter Your Password",
                          ),
                          focusNode: focusNodePassword,
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 800),
                      duration: const Duration(milliseconds: 900),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ForgotPassword()));
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0xFF835DF1),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 700),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {

                                  // Navigate to VendorHomeScreen if conditions are met
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const VendorHomeScreen(),
                                    ),
                                  );
                                } ,

                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Satoshi',
                                ),
                                backgroundColor: const Color(0xFF835DF1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: FadeInUp(
                                delay: const Duration(milliseconds: 700),
                                duration: const Duration(milliseconds: 800),
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 800),
                      duration: const Duration(milliseconds: 900),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VendorRegister()));
                            },
                            child: const Text(
                              "Register Now!",
                              style: TextStyle(
                                color: Color(0xFF835DF1),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
