import 'package:flutter/material.dart';


import '../menubar/sidemenu.dart';
import 'blog_form.dart';

class BlogScreen extends StatelessWidget {
  // Sample image URLs
  final List<String> _imageUrls = [
    'assets/images/body/temple.png',
    'assets/images/body/temple.png',
    'assets/images/body/temple.png',
  ];

  final List<String> _titles = [
    'Title 1',
    'Title 2',
    'Title 3',
  ];
  final List<String> _location = [
    'chennai',
    'Madurai',
    'Salem',
  ];
  final List<String> _description = [
    "A temple is a religious building that's meant for worshipping or praying.",
    "A temple is a religious building that's meant for worshipping or praying.",
    "A temple is a religious building that's meant for worshipping or praying.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: ListView.builder(
        itemCount: _imageUrls.length,
        itemBuilder: (context, index) {
          return Container(
            child: ImageItem(
              imageUrl: _imageUrls[index],
              title: _titles[index],
              location: _location[index],
              description: _description[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyForm()));          // This function will be called when the button is pressed
        },
        child: Icon(Icons.filter_rounded),
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String description;

  ImageItem(
      {required this.imageUrl,
      required this.title,
      required this.location,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show image details when tapped
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ImageDetails(
              imageUrl: imageUrl,
              title: title,
              location: location,
              description: description,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageDetails extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String description;

  ImageDetails(
      {required this.imageUrl,
      required this.title,
      required this.location,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start, // Align children to the start
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(imageUrl),
          SizedBox(height: 16.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            //  textAlign: TextAlign.left,
          ),
          SizedBox(height: 8.0),
          Text(
            location,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            // textAlign: TextAlign.left,
          ),
          SizedBox(height: 8.0),
          Text(description,
              style: TextStyle(
                fontSize: 16,
              )),
        ],
      ),
    );
  }
}
