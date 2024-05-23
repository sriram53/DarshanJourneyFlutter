import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../account/my_profile.dart';
import 'change_password.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  bool showPassword = false;
  Uint8List? _image;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.amber[700],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios), // Icon for the back arrow
            onPressed: () {
              Navigator.pop(
                  context
                 ); // Navigate back when pressed
            },
          ),
          iconTheme: const IconThemeData(
            color: Colors.black, // Change the color of the back arrow here
          ),
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: MemoryImage(_image!))
                            : const CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    "https://hpkapital.com/img/img/default_user.jpeg"),
                              ),
                        Positioned(
                            bottom: -0,
                            left: 60,
                            child: Container(
                                height: 30,
                                width: 30,
                                // ignore: prefer_const_constructors
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // border: Border.all(
                                  //   width: 2,
                                  //   color:
                                  //       Theme.of(context).scaffoldBackgroundColor,
                                  // ),
                                  color: const Color(0xFF835DF1),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    showImagePickerOption(context);
                                  },
                                  icon: const Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfileForm()));
                        },
                        child: Text('Edit Profile',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 12)),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(Icons.person_outline_rounded,
                                size: 30), // Example icon
                            SizedBox(width: 15), // Spacer
                            Text('Arun',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.email_outlined,
                                size: 30), // Example icon
                            SizedBox(width: 15), // Spacer
                            Text('arun@gmail.com',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.phone_android_rounded,
                                size: 30), // Example icon
                            SizedBox(width: 15), // Spacer
                            Text('9876543212',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.amber,
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Manage your password',
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePasswordScreen()),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lock_open_rounded,
                                  size: 30,
                                  color: Colors.black,
                                ), // Example icon
                                SizedBox(width: 15),
                                Text(
                                  'Change Password',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  //     SizedBox(height: 20), // Add some spacing between buttons
                  //     ElevatedButtonWithIcon(
                  //       text: 'My Profile',
                  //       icon: Icons.arrow_forward_ios_rounded,
                  //       onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => UserProfileForm()),
                  // ); //
                  //         // Add your onPressed action here
                  //       },
                  //     ),
                  //     SizedBox(height: 20), // Add some spacing between buttons
                  //     ElevatedButtonWithIcon(
                  //       text: 'My Booking',
                  //       icon: Icons.arrow_forward_ios_rounded,
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => UserProfileForm()),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            )));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            //filled: true,
            //fillColor: Colors.black,
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 10, top: 60, right: 10, bottom: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 140, // Increased height to accommodate the title and icons
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 0.1),
                  child: Text(
                    'Profile Photo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _pickImageFromGallery();
                        },
                        child: const SizedBox(
                          child: Column(
                            children: [
                              Icon(
                                Icons.image,
                                size: 50,
                                color: Colors.black,
                              ),
                              Text("Gallery")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _pickImageFromCamera();
                        },
                        child: const SizedBox(
                          child: Column(
                            children: [
                              Icon(
                                Icons.camera_alt_rounded,
                                size: 50,
                                color: Colors.black,
                              ),
                              Text("Camera")
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  void _showSavedSuccessfullyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("Data saved successfully!"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                // Add your logic to navigate to the next screen or perform login
              },
            ),
          ],
        );
      },
    );
  }
}

class TextFormFieldWithTitle extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  TextFormFieldWithTitle({
    required this.title,
    required this.controller,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(
              icon,
              size: 20.0,
            ),
          ]),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ElevatedButtonWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const ElevatedButtonWithIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            Icon(icon),
          ],
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16), // Adjust padding as per your requirement
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )));
  }
}
