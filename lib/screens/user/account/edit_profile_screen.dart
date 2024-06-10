import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../notification.dart';
import 'my_profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();

  bool showPassword = false;
  Uint8List? _image;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  const Text(
                    "Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: MemoryImage(_image!))
                            : const CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                    "https://w7.pngwing.com/pngs/86/421/png-transparent-computer-icons-user-profile-set-of-abstract-icon-miscellaneous-monochrome-computer-wallpaper.png"),
                              ),
                        Positioned(
                            bottom: -0,
                            left: 70,
                            child: Container(
                                height: 35,
                                width: 35,
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
                                    size: 20,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButtonWithIcon(
                        text: 'Dasboard',
                        icon: Icons.arrow_forward_ios_rounded,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen()),
                          ); // Add your onPressed action here
                        },
                      ),
                      SizedBox(height: 20), // Add some spacing between buttons
                      ElevatedButtonWithIcon(
                        text: 'My Profile',
                        icon: Icons.arrow_forward_ios_rounded,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfileForm()),
                          ); //
                          // Add your onPressed action here
                        },
                      ),
                      SizedBox(height: 20), // Add some spacing between buttons
                      ElevatedButtonWithIcon(
                        text: 'My Booking',
                        icon: Icons.arrow_forward_ios_rounded,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfileForm()),
                          );
                        },
                      ),
                    ],
                  ),
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
