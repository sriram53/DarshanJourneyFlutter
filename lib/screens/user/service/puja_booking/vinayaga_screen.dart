import 'package:flutter/material.dart';

import 'puja_booking.dart';

class VinayagaScreen extends StatelessWidget {
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
          'Vinayaga Pooja Booking ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
              'assets/booking/images/vinayaga_image.jpg',
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Ganesh Pooja is a revered Hindu ritual dedicated to Lord Ganesha, the elephant-headed god known as the remover of obstacles and the patron of new beginnings. It is especially significant during the festival of Ganesh Chaturthi, where devotees perform the pooja to invoke his blessings for wisdom, prosperity, and the removal of obstacles. The ritual involves setting up an idol of Lord Ganesha, making offerings such as sweets (notably modak), flowers, and fruits, and chanting prayers. The ceremony encapsulates devotion, beginning with the invocation of Ganesha, followed by offerings, and concluding with the aarti. This tradition not only strengthens spiritual faith but also fosters communal harmony, bringing people together in celebration.",
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
            // Wrap buttons with a Row for horizontal layout
            Row(
              mainAxisSize: MainAxisSize
                  .min, // Use the minimum space that's needed by the children
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
