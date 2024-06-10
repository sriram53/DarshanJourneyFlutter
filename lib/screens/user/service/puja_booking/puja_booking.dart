
import '../service.dart';
import 'ear_piercing_screen.dart';
import 'house_warming_screen.dart';
import 'name_cermony_screen.dart';
import 'parigaram_screen.dart';
import 'package:flutter/material.dart';

import 'thevasam_screen.dart';
import 'vinayaga_screen.dart';
import 'wedding_screen.dart';

class PujaScreen extends StatelessWidget {
  const PujaScreen({super.key});

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
        title: const Text(
          'Puja Booking',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20.0),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        children: [
          ContainerWithImage(
            image: const AssetImage('assets/booking/icons/wedding_icon.png'),
            label: 'Wedding',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeddingScreen(),
                ),
              );
            },
          ),
          ContainerWithImage(
            image: const AssetImage('assets/booking/icons/vinayaga_icon.png'),
            label: 'Ganapathi pooja',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VinayagaScreen(),
                ),
              );
            },
          ),
          ContainerWithImage(
            image: const AssetImage('assets/booking/icons/thevasam_icon.png'),
            label: 'Thevasam',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThevasamScreen(),
                ),
              );
            },
          ),
          ContainerWithImage(
            image: const AssetImage('assets/booking/icons/temple_icon.png'),
            label: 'Pariharam',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Parigaaram(),
                ),
              );
            },
          ),
          ContainerWithImage(
            image:
                const AssetImage('assets/booking/icons/name_cermony_icon.png'),
            label: 'Name ceremony',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NameCermonyScreen(),
                ),
              );
            },
          ),
          ContainerWithImage(
            image:
                const AssetImage('assets/booking/icons/house_warming_icon.png'),
            label: 'House warming',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HouseWarmingScreen(),
                ),
              );
            },
          ),
          ContainerWithImage(
            image:
                const AssetImage('assets/booking/icons/ear_piercing_icon.png'),
            label: 'Ear Piercing',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EarPiercingScreen(),
                ),
              );
            },
          ),
          ContainerWithImage(
            image:
                const AssetImage('assets/booking/icons/house_warming_icon.png'),
            label: 'Settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HouseWarmingScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ContainerWithImage extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final VoidCallback onTap;

  const ContainerWithImage({
    super.key,
    required this.image,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRect(
        child: Container(
          decoration: BoxDecoration(
            color:
              Colors.yellow[600],
            borderRadius: BorderRadius.circular(10.0),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: image,
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10.0),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white, // You can set the color here if needed
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
