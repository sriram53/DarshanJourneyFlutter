import 'package:flutter/material.dart';
import 'trainer_screen.dart';

class BookingScreen extends StatelessWidget {
  final Trainer trainer;

  BookingScreen({required this.trainer});

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
                        const TrainerListScreen())); // Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: Text('Book ${trainer.name}',
        style: TextStyle(
          color:Colors.black,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Booking Details',
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 20),
            Text('Trainer Name: ${trainer.name}'),
            Text('Specialty: ${trainer.specialty}'),
            SizedBox(height: 20),
            Text('Experiences:', style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: trainer.experiences.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(trainer.experiences[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                trainer.image,
                width: 200,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.amber.shade400, Colors.amber.shade700],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your booking logic here
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .transparent, // Set button background color as transparent
                    shadowColor: Colors.transparent, // Remove button shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('Confirm Booking'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
