import 'package:flutter/material.dart';
import 'booking_screen.dart';
// Assuming this file exists and contains the right paths
import '../service.dart';


class TrainerListScreen extends StatefulWidget {
  const TrainerListScreen({super.key});

  @override
  _TrainerListScreenState createState() => _TrainerListScreenState();
}

class _TrainerListScreenState extends State<TrainerListScreen> {
  final List<Trainer> trainers = [
    Trainer(
      name: "Ambi",
      specialty: " Both Parigaram and thevasam",
      image:'assets/trainer_booking/pandit_trainer1.jpg' ,
      experiences: [
        'Experience 8 years',
      ],
    ),
    Trainer(
      name: "VenuGopal",
      specialty: "Only Parigaram",
      image:'assets/trainer_booking/pandit_trainer2.jpeg',
      experiences: [
        'Experience 15 years'
      ], // You can provide an empty list if no experiences are available
    ),
    Trainer(
      name: "Ramachary",
      specialty: "Both Parigaram and thevasam",
      image: 'assets/trainer_booking/pandit_trainer3.jpeg',
      experiences: [
        'Experience 20 years'
      ], // You can provide an empty list if no experiences are available
    ),

    // Add more trainers as needed
  ];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

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
        title: Text("Book Your Trainer",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: AnimatedList(
          key: _listKey,
          initialItemCount: trainers.length,
          itemBuilder: (context, index, animation) {
            final trainer = trainers[index];
            return _buildTrainerItem(trainer, animation);
          },
        ),
      ),
    );
  }

  Widget _buildTrainerItem(Trainer trainer, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors
              .white, // Optional: Set a background color for each trainer item
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(trainer.image),
          ),
          title: Text(trainer.name),
          subtitle: Text(trainer.specialty),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingScreen(trainer: trainer),
              ),
            );
          },
          trailing: IconButton(
            icon: Icon(
                Icons.keyboard_arrow_right_rounded), // Change the icon to bell
            onPressed: () {
              print('Notification for ${trainer.name}');
            },
          ),
        ),
      ),
    );
  }
}

class Trainer {
  final String name;
  final String specialty;
  final String image;
  final List<String> experiences;

  Trainer({
    required this.name,
    required this.specialty,
    required this.image,
    required this.experiences, // Required experiences parameter in the constructor
  });
}
