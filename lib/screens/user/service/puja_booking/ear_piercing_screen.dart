import 'package:flutter/material.dart';

import 'puja_booking.dart';

class EarPiercingScreen extends StatelessWidget {
  const EarPiercingScreen({super.key});

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
          'Ear piercing Booking ',
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
              'assets/booking/images/earpiercing_image.jpg',
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "An ear piercing ceremony, often a cultural or personal tradition, involves the perforation of the earlobe or other parts of the ear for the purpose of wearing jewelry. It can signify cultural heritage, coming-of-age rituals, or personal expression. Typically, it involves a symbolic or ceremonial aspect, accompanied by rituals or celebrations. The process can vary widely across cultures and regions, from simple piercings performed at home to elaborate ceremonies conducted by professionals or within religious contexts.",
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
