import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
                context); // Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: const Text(
          'Help',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(

              title: Text(
                'Customer care Number?',
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 6, 68),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    'At [Company Name], we are dedicated to providing exceptional customer service. Our team is here to assist you with any inquiries, concerns, or feedback you may have. Please feel free to reach out to us via our customer care helpline:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.fiber_manual_record,size: 15,color: Color.fromARGB(255, 95, 6, 68)),
                  title: Text(
                    'Call our customer care number during operating hours.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.fiber_manual_record,size: 15,color: Color.fromARGB(255, 95, 6, 68)),
                  title: Text(
                    'You can also reach us via email at [Insert Email Address].',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                // Add more instructions as needed
              ],
            ),
            ExpansionTile(
              title: Text(
                'The Terms for cancellation?',
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 6, 68),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    'We understand that circumstances may arise where you need to cancel a service or an order. Please review our cancellation policy below for more information:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                // ListTile(
                //   leading: Icon(Icons.fiber_manual_record,size: 15,color: Color.fromARGB(255, 95, 6, 68)),
                //   title: Text(
                //     'Call our customer care number during operating hours.',
                //     style: TextStyle(
                //       fontSize: 16,
                //       color: Colors.black,
                //     ),
                //     textAlign: TextAlign.justify,
                //   ),
                // ),
                // ListTile(
                //   leading: Icon(Icons.fiber_manual_record,size: 15,color: Color.fromARGB(255, 95, 6, 68)),
                //   title: Text(
                //     'You can also reach us via email at [Insert Email Address].',
                //     style: TextStyle(
                //       fontSize: 16,
                //       color: Colors.black,
                //     ),
                //     textAlign: TextAlign.justify,
                //   ),
                // ),
                // Add more instructions as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}
