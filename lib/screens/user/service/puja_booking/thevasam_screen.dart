import 'package:flutter/material.dart';

import 'puja_booking.dart';

class ThevasamScreen extends StatelessWidget {
  const ThevasamScreen({super.key});

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
          'Thidhi Booking ',
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
              'assets/booking/images/thidhi_image.jpeg',
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Death thithi in Hindu tradition refers to the observance of rituals on the anniversary of a person's death. It is a day of remembrance and respect, marked by performing rites and offering prayers to honor the deceased's soul. The rituals are aimed at providing peace to the departed soul and seeking their blessings for the family. Family members often perform a special puja, make offerings to Brahmins, and provide food to the needy on this day, believing these acts contribute to the well-being of the soul in its journey after death. The specific practices and the significance attached to them can vary among different communities, but the underlying intention is to express reverence and keep the memory of the deceased alive within the family and community.",
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20),
            // Adjusted part for horizontal buttons
            Row(
              mainAxisSize: MainAxisSize
                  .min, // To keep the Row width as per the children width
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add to cart functionality goes here
                  },
                  child: const Text('With Products'),
                  style: ElevatedButton.styleFrom(),
                ),
                const SizedBox(width: 30), // Space between the buttons
                ElevatedButton(
                  onPressed: () {
                    // Add functionality for the second button here
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
