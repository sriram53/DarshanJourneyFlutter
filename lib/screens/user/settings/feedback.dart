import 'package:flutter/material.dart';

import 'user_settings.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

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
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const SettingsScreen())); // Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: const Text(
          'Feedback Form',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
        child: Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 550,
              width: 500,
              color: Colors.orangeAccent[100],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your Name',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _subjectController,
                        decoration: InputDecoration(
                          labelText: 'Subject',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'Enter your Subject',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Subject';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _feedbackController,
                        decoration: InputDecoration(
                          labelText: 'Feedback',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'Enter your feedback here',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Feedback';
                          }
                          return null;
                        },
                        maxLines: 5,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _submitFeedback,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      // Here you can implement the logic to submit feedback
      String name = _nameController.text;
      String email = _emailController.text;
      String subject = _subjectController.text;
      String feedback = _feedbackController.text;

      // For example, you can send the feedback to a server or save it locally
      // In this example, we just print the feedback to the console
      print('Name: $name');
      print('Email: $email');
      print('Subject: $subject');
      print('Feedback: $feedback');

      // Show a snackbar to indicate that feedback has been submitted
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Feedback submitted!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Clear all text fields
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _feedbackController.clear();
    }
  }
}
