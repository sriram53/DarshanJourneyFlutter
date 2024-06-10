import 'package:flutter/material.dart';
import '../service.dart';
import 'guide_model.dart';

class BookingForm extends StatefulWidget {
  final Guide guide;

  BookingForm({required this.guide});

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  // ignore: unused_field
  late String _email;
  // ignore: unused_field
  late String _phoneNumber;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Icon for the back arrow
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Cards())); // Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: Text(
          'Book ${widget.guide.name}',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset(widget.guide.imageUrl, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Your Email',
                    icon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Added padding to the row
                child: Row(
                  children: [
                    Icon(Icons.phone), // Icon for the phone number
                    SizedBox(
                        width:
                            10), // Adjust the width according to your preference
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp(r"^\+?[0-9]{10}$").hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                        onSaved: (value) => _phoneNumber = value!,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Select Date: ${_date.toString().split(' ')[0]}'),
                trailing: Icon(Icons.calendar_today),
                onTap: _pickDate,
              ),
              ListTile(
                title: Text('Select Time: ${_time.format(context)}'),
                trailing: Icon(Icons.access_time),
                onTap: _pickTime,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Booking successful for $_name')),
                      );
                    }
                  },
                  child: Text('Book Now',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
