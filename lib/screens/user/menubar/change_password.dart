import 'package:flutter/material.dart';


class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Icon for the back arrow
          onPressed: () {
            Navigator.pop(
                context); // Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Current Password',
                  hintText: 'Enter your current password',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'New Password',
                  hintText: 'Enter your new password',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                  hintText: 'Enter your Confirm password',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _changePassword();
              },
              child: Text(
                'Change Password',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to Forgotten Password screen
                  // Navigator.pushNamed(context, '/forgot_password');
                },
                child: Text(
                  'Forgotten Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _changePassword() {
    String currentPassword = _currentPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Check if current password matches
    // Check if new password and confirm password match
    if (currentPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmPassword.isEmpty) {
      _showErrorDialog('All fields are required');
      return;
    }

    if (newPassword != confirmPassword) {
      _showErrorDialog('New password and confirm password do not match');
      return;
    }

    // Here you can implement your logic to change the password
    // For example, you might call an API to change the password

    // Clear text fields after successful password change
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();

    // Show success message
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Success'),
        content: Text('Password changed successfully'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
