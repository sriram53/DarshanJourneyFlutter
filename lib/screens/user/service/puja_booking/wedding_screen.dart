import 'package:flutter/material.dart';

import 'puja_booking.dart';

class WeddingScreen extends StatelessWidget {
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
          'Wedding Booking ',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Image.asset(
              'assets/booking/images/wedding_image.jpg',
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "A wedding is a joyous celebration where two people publicly declare their commitment to each other. It typically involves a ceremony, where vows are exchanged, followed by a reception for family and friends. Weddings often incorporate cultural, religious, and personal traditions, and they are memorable occasions filled with love, laughter, and cherished moments that mark the start of a new chapter in the couple's lives.",
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min, // Aligns the buttons to the center of the row
              children: [
                ElevatedButton(
                  onPressed: () {
                    // "With Products" button functionality goes here
                  },
                  child: Text('With Products'),
                  style: ElevatedButton.styleFrom(),
                ),
                SizedBox(width: 20), // Space between the buttons
                ElevatedButton(
                  onPressed: () {
                    // "Without Products" button functionality goes here
                  },
                  child: Text('Without Products'),
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
