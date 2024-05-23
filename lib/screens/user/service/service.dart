import 'package:flutter/material.dart';

import '../menubar/sidemenu.dart';
import 'guide/guide_list.dart';
import 'puja_booking/puja_booking.dart';
import 'trainer_booking/trainer_screen.dart';

class ServiceScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String detailText;
  final Widget nextPage;

  const ServiceScreen(
      this.imagePath, this.title, this.detailText, this.nextPage,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the next page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Card(
        elevation: 5, // Adjusts the shadow beneath the card
        margin: const EdgeInsets.only(
            left: 20, right: 20, top: 0, bottom: 0), // Margin around the card
        child: Container(
          width: MediaQuery.of(context).size.width, // Width of the card
          height: 300, // Adjusted height of the card to accommodate content
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Padding inside the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Provides spacing between widgets
                Image.asset(
                  imagePath, // Path to your image asset
                  width:
                      MediaQuery.of(context).size.width, // Width of the image
                  height: 180, // Height of the image
                  fit: BoxFit.fill, // Adjusts how the image is fitted inside the box
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10), // Provides spacing between widgets
                Text(
                  detailText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final String title;

  const NextPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('This is the $title page.'),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
            actions: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Image.asset(
                      'assets/images/titlelogo.png',
                      height: 170,
                      width: 170,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality here
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => EditProfileScreen()),
                // );
              },
            ),
          ],

      ),
      body:Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const ServiceScreen(
                'assets/service/puja.jpg',
                'Puja Booking',
                "We can booking the puja's.",
                PujaScreen(), // Page for the first card
              ),
              const SizedBox(height: 20), // Provides spacing between cards
              const ServiceScreen(
                'assets/service/iyer.jpg',
                'Trainer Booking',
                'We can booking the trainer.',
                TrainerListScreen(), // Page for the second card
              ),
              const SizedBox(height: 20), // Provides spacing between cards
              const ServiceScreen(
                'assets/service/func_iyer.jpg',
                'Iyer',
                'We can Booking the Iyer for our function.',
                NextPage('Iyer'), // Page for the third card
              ),
              const SizedBox(height: 20), // Provides spacing between cards
              ServiceScreen(
                'assets/service/guide1.jpg',
                'Guide',
                'We can booking the Guide for Travel.',
                GuideList(), // Page for the fourth card
              ),
              // Provides spacing between cards
            ],
          ),
        ),
      ),
    );
  }
}
