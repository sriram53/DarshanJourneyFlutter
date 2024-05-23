import 'package:flutter/material.dart';

import 'puja_booking.dart';

class HouseWarmingScreen extends StatelessWidget {
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
          'House Warming Booking ',
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
              'assets/booking/images/house_warming_image.jpg',
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                " A housewarming ceremony is a traditional celebration held when a family or individual moves into a new home. It is often marked by inviting friends, family, and neighbors to bless the new dwelling and wish the occupants prosperity and happiness. Rituals may include lighting lamps, breaking a coconut, or conducting prayers, depending on cultural or regional customs. Gifts, food, and drinks are typically shared as a gesture of hospitality and to foster community bonds. The ceremony symbolizes a fresh start and the beginning of a new chapter in the occupants' lives.",
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
