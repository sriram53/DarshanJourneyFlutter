// ignore_for_file: unused_field
import 'package:flutter/material.dart';

class UserProfileForm extends StatefulWidget {
  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  final _formKey = GlobalKey<FormState>();

  // Variables to store user input data
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phoneNumber = '';
  String _country = '';
  String _state = '';
  String _district = '';
  List<String> _gender = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Icon for the back arrow
          onPressed: () {
            Navigator.of(context).pop();
            //  // Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Card(
                color: Colors.grey[400],
                elevation: 2,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight
                                  .bold // Change this color to whatever you desire
                              ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _firstName = value!;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight
                                  .bold // Change this color to whatever you desire
                              ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _lastName = value!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.grey[400],
                elevation: 2,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight
                              .bold // Change this color to whatever you desire
                          ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                ),
              ),
              Card(
                color: Colors.grey[400],
                elevation: 2,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight
                              .bold // Change this color to whatever you desire
                          ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phoneNumber = value!;
                    },
                  ),
                ),
              ),
              Card(
                color: Colors.grey[400],
                elevation: 2,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Country',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight
                                  .bold // Change this color to whatever you desire
                              ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your country';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _country = value!;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'State',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight
                                  .bold // Change this color to whatever you desire
                              ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your state';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _state = value!;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'District',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight
                                  .bold // Change this color to whatever you desire
                              ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your district';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _district = value!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                  color: Colors.grey[400],
                  elevation: 2,
                  margin: EdgeInsets.all(10),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, bottom: 5),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 250, top: 15),
                          child: Text(
                            'Gender',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Male',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          value: _gender.contains('Male'),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value != null && value) {
                                _gender
                                    .clear(); // Clear any existing selections
                                _gender.add('Male'); // Add 'Male' to the list
                              } else {
                                _gender.remove(
                                    'Male'); // Remove 'Male' from the list
                              }
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Female',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          value: _gender.contains('Female'),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value != null && value) {
                                _gender
                                    .clear(); // Clear any existing selections
                                _gender
                                    .add('Female'); // Add 'Female' to the list
                              } else {
                                _gender.remove(
                                    'Female'); // Remove 'Female' from the list
                              }
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Others',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          value: _gender.contains('Others'),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value != null && value) {
                                _gender
                                    .clear(); // Clear any existing selections
                                _gender
                                    .add('Others'); // Add 'Female' to the list
                              } else {
                                _gender.remove(
                                    'Others'); // Remove 'Female' from the list
                              }
                            });
                          },
                        ),
                      ]))),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 90, left: 90),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: Size(100, 50),
                  ),
                  child: Text(
                    'Update',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
