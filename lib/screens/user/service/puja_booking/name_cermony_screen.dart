import 'package:flutter/material.dart';

import 'puja_booking.dart';

class NameCermonyScreen extends StatelessWidget {
  const NameCermonyScreen({super.key});

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
                        const PujaScreen())); // Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: const Text(
          'Name Cermony Booking ',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/booking/images/name_cermony_image.jpg',
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "A naming ceremony is a cultural or religious event held to celebrate and officially bestow a name upon a newborn or an individual who has undergone a significant life transition, such as conversion to a new faith or adoption. It often involves family and friends gathering to witness the naming, along with prayers, blessings, and rituals specific to the culture or religion. The ceremony serves to welcome the individual into the community and affirm their identity within their cultural or religious context.",
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20),
            // Wrap buttons with a Row for horizontal layout
            Row(
              mainAxisSize: MainAxisSize
                  .min, // Use the minimum space that's needed by the children
              children: [
                ElevatedButton(
                  onPressed: () {
                    // "With Products" button functionality goes here
                  },
                  child: const Text('With Products'),
                  style: ElevatedButton.styleFrom(),
                ),
                const SizedBox(width: 20), // Space between the buttons
                ElevatedButton(
                  onPressed: () {
                    // "Without Products" button functionality goes here
                  },
                  child: const Text('Without Products'),
                  style: ElevatedButton.styleFrom(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
