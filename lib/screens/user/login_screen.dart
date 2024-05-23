
import 'package:darshan_journey/screens/user/bottom_nav/bottom_nav.dart';
import 'package:darshan_journey/screens/user/sign_up.dart';
import 'package:darshan_journey/screens/user_vendor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final resetKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _resetController = TextEditingController();
  bool _isNotValidate = false;

  // void registerUser() async {
  // if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
  //     var regBody = {
  //       "email":_emailController.text,
  //       "password":_passwordController.text
  //     };
  //     var response = await http.post(Uri.parse(registration),
  //     headers: {"Content-Type":"application/json"},
  //     body: jsonEncode(regBody)
  //     );
  //     var jsonResponse = jsonDecode(response.body);
  //     print(jsonResponse['status']);
  //     if(jsonResponse['status']){
  //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
  //     }else{
  //       print("SomeThing Went Wrong");
  //     }
  //   }else{
  //     setState(() {
  //       _isNotValidate = true;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Icon for the back arrow
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const UserVendor())); // Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF835DF1), // Change the color of the back arrow here
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login",
                        style: GoogleFonts.workSans(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF835DF1))),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          // validator: (value) =>
                          //     value!.isEmpty ? "Email cannot be empty." : null,
                          controller: _emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
                            errorText: _isNotValidate
                                ? "Email cannot be empty."
                                : null,
                            errorStyle: TextStyle(color: Colors.red),
                            border: OutlineInputBorder(),
                            label: Text("Email"),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (value) => value!.length < 8
                              ? "Password should have atleast 8 characters."
                              : null,
                          controller: _passwordController,
                          obscureText: true,
                          decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
                            border: OutlineInputBorder(),
                            label: Text("Password"),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text("Reset Password"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                                "Please enter your email we will send a recovery link."),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Form(
                                              key: resetKey,
                                              child: TextFormField(
                                                controller: _resetController,
                                                validator: (value) => value!
                                                        .isEmpty
                                                    ? "Please enter a valid email."
                                                    : null,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  label: Text("Email"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Cancel")),
                                          TextButton(
                                              onPressed: () {
                                                if (resetKey.currentState!
                                                    .validate()) {
                                                  sendRecoveryMail(
                                                          _resetController.text)
                                                      .then((value) {
                                                    Navigator.pop(context);
                                                    if (value) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content: const Text(
                                                          "Recovery Mail Sent",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        backgroundColor: Colors
                                                            .green.shade400,
                                                      ));
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content: const Text(
                                                          "Cannot Sent Recovery Mail",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        backgroundColor:
                                                            Colors.red.shade400,
                                                      ));
                                                    }
                                                  });
                                                }
                                              },
                                              child: const Text("Send Link"))
                                        ],
                                      ));
                            },
                            child: Text(
                              "Forget Password",
                              style: TextStyle(color: Colors.blue.shade700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 65,
                        width: MediaQuery.of(context).size.width * .9,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                loginUser(_emailController.text,
                                        _passwordController.text)
                                    .then((value) {
                                  if (value == "success") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: const Text(
                                        "Login Successful",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.green.shade400,
                                    ));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavigationBar1()));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      backgroundColor: Colors.red.shade400,
                                    ));
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                  0xFF835DF1), // Change button color here
                              // padding: const EdgeInsets.symmetric(horizontal: 50),
                              // elevation: 2,
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(20),
                              // ),
                            ),
                            child: const Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 65,
                      width: MediaQuery.of(context).size.width * .9,
                      child: OutlinedButton(
                          onPressed: () {
                            continueWithGoogle().then((value) {
                              if (value) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: const Text(
                                    "Google Login Successful",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green.shade400,
                                ));
                                Navigator.pushReplacementNamed(
                                    context, "/home");
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: const Text(
                                    "Google Login Failed",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red.shade400,
                                ));
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/google.png",
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Continue with Google",
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have and account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpPage()));
                            },
                            child: const Text("Sign Up"))
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
