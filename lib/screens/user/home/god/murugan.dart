
import 'package:flutter/material.dart';

import '../../temple/temple_landing.dart';
import 'god_card.dart';

class MuruganScreen extends StatefulWidget {
  late final String godname;

  MuruganScreen({required this.godname});

  @override
  State<MuruganScreen> createState() => _MuruganScreenState();
}

class _MuruganScreenState extends State<MuruganScreen> {
  final TextEditingController _searchController = TextEditingController();
    bool isSearchClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: isSearchClicked
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (context){},
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      hintText: 'Search..'),
                ),
              ) : Text(
          '${widget.godname}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchClicked = !isSearchClicked;
                if (!isSearchClicked) {
                  _searchController.clear();

                }
              });
            },
            icon: Icon(isSearchClicked ? Icons.close : Icons.search),
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            GodButton(
              templeName: 'Arulmigu Dhandayuthapani Swamy Temple',
              templeLocation: 'Palani',
              imageUrl: 'assets/images/body/temple1.png',
              onPressed: () {
                // Add your logic here
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TempleLandingPage()));
              },
            ),
            GodButton(
              templeName: 'Arulmigu Subramaniya Swamy Temple',
              templeLocation: 'Thiruparankundram',
              imageUrl: 'assets/images/body/temple1.png',
              onPressed: () {
                // Add your logic here
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TempleLandingPage()));
              },
            ),
            GodButton(
              templeName: 'Arulmigu Subramaniya Swamy Temple',
              templeLocation: '	Tiruchendur',
              imageUrl: 'assets/images/body/temple1.png',
              onPressed: () {
                // Add your logic here
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TempleLandingPage()));
              },
            ),
            GodButton(
              templeName: 'Arulmigu Subramaniya Swamy Temple',
              templeLocation: 'Tiruttani',
              imageUrl: 'assets/images/body/temple1.png',
              onPressed: () {
                // Add your logic here
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TempleLandingPage()));
              },
            ),
            // GodButton(
            //   templeName: 'Temple E',
            //   templeLocation: 'Location E',
            //   imageUrl: 'assets/images/body/temple1.png',
            //   onPressed: () {
            //     // Add your logic here
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => TempleLandingPage()));
            //   },
            // ),
            // Add more TempleButton widgets here for additional temples
          ],
        ),
      ),
    );
  }
}
