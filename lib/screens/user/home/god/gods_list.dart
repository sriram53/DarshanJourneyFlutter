import 'package:flutter/material.dart';
import 'amman.dart';
import 'ayyappan.dart';
import 'ganesh.dart';
import 'hanuman.dart';
import 'murugan.dart';
import 'nataraja.dart';
import 'navagraha.dart';
import 'shivan.dart';
import 'vishnu.dart';

class GodListButton extends StatelessWidget {
  final String godname;
  final String imageUrl;
  final VoidCallback onPressed;

  const GodListButton({
    Key? key,
    required this.godname,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange[200],
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Container(
                //color: Colors.deepPurpleAccent,
                height: 80,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      child: Image.asset(
                        imageUrl, // Add your image URL here
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.0), // Add some space between columns
                    // Second column for text
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              godname,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                            Icon(
                              Icons
                                  .arrow_forward_ios_rounded, // Replace with the desired icon
                              color: Colors.white,
                              size: 19,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),

    );
  }
}

class GodsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Icon for the back arrow
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: Text(
          'List Of Gods',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            GodListButton(
              godname: 'Ganesh',
              imageUrl: 'assets/images/body/gods/ganesh.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GaneshScreen(godname: 'Ganesh')),
                );
              },
            ),
            GodListButton(
                godname: 'Shivan',
                imageUrl: 'assets/images/body/gods/shivan.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        ShivaScreen(godname: 'Shiva')),
                  );
                }),
            GodListButton(
              godname: 'Murugan',
              imageUrl: 'assets/images/body/gods/murugan.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MuruganScreen(godname: 'Murugan')),
                );
              },
            ),
            GodListButton(
              godname: 'Hanuman',
              imageUrl: 'assets/images/body/gods/Hanuman.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Hanuman(godname: 'Hanuman')),
                );
              },
            ),
            GodListButton(
              godname: 'Vishnu',
              imageUrl: 'assets/images/body/gods/vishnu.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Vishnu(godname: 'Vishnu')),
                );
              },
            ),
            GodListButton(
              godname: 'Amman',
              imageUrl: 'assets/images/body/gods/Amman.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Amman(godname: 'Amman')),
                );
              },
            ),
            GodListButton(
              godname: 'Ayyappan',
              imageUrl: 'assets/images/body/gods/Ayyappan.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Ayyappan(godname: 'Ayyappan')),
                );
              },
            ),
            GodListButton(
              godname: 'Navagraha',
              imageUrl: 'assets/images/body/gods/Navagraha.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Navagraha(godname: 'Navagraha')),
                );
              },
            ),
            GodListButton(
              godname: 'Nataraja',
              imageUrl: 'assets/images/body/gods/Nataraja.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Nataraja(godname: 'Nataraja')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}


// interact and socially connect to other people in the society and around the world.
// Sharing multimedia content like photos, videos, GIFs, memes etc.
// Expressing opinions, ideas, and thoughts through posts and comments.
//  Companies use social platforms for digital marketing like paid ad campaigns to increase brand awareness

// Technology has become a part of our daily lives, from Simple Watches to Computers.
// A few days ago, we used the Electronic Voting Machine (EVM) to cast our votes.

// Education should be available to everyone, regardless of their background or location.
// Education is a basic need for everyone in the modern day to live a good life
