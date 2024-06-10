import 'package:darshan_journey/screens/user/calendar/Calendar_events.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../menubar/sidemenu.dart';
import 'package:intl/intl.dart';

import '../temple/temple_landing.dart';
import 'god/ganesh.dart';
import 'god/gods_list.dart';
import 'god/murugan.dart';
import 'god/shivan.dart';
import 'god/vishnu.dart';
import 'list_of_temple_more.dart';
import 'popular_temple_more.dart';
import 'search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> gods = [
    'assets/images/body/gods/ganesh.png', // Placeholder URL, replace with actual image URLs
    'assets/images/body/gods/murugan.png', // Placeholder URL, replace with actual image URLs
    'assets/images/body/gods/shivan.png', // Placeholder URL, replace with actual image URLs
    'assets/images/body/gods/vishnu.png', // Placeholder URL, replace with actual image URLs
  ];

  final List<String> images = [
    'assets/images/body/calendarbc.png',
    'assets/images/body/calendarbc.png',
  ];

  final List<String> names = [
    'Meenakshi Amman Temple \nMadurai',
    'Sri Ranganathaswamy Temple \nSrirangam ',
  ];

  final List<String> image = [
    'assets/images/body/calendarbc.png',
    'assets/images/body/calendarbc.png',
    'assets/images/body/calendarbc.png',
  ];

  final List<String> popular = [
    'Meenakshi Amman Temple \nMadurai',
    'Sri Ranganathaswamy Temple \nSrirangam ',
    'Brihadeeswarar \nTemple \nThanjavur',
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat("dd").format(now);
    final formattedDayOfWeek = DateFormat("EEEE").format(now);
    final formattedMonth = DateFormat("MMMM").format(now);
    final formattedYear = DateFormat("yyyy").format(now);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchFilterPage()),
              ); // Implement search functionality here
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
      //endDrawer: const NotificationScreen(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Gods',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                          //textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Add functionality for "Show All" button here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GodsList(),
                            ),
                          );
                        },
                        //backgroundColor: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'See All',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors
                                    .black, // You can adjust the color as needed
                                size: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 1),

            // list of gods
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: gods.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(3),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the new screen when the image is tapped
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GaneshScreen(
                                              godname: 'Ganesh',
                                            )),
                                  );
                                  break;
                                case 1:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MuruganScreen(
                                              godname: 'Murugan',
                                            )),
                                  );
                                  break;
                                case 2:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShivaScreen(godname: 'Shiva')),
                                  );
                                  break;
                                case 3:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Vishnu(godname: 'Vishnu')),
                                  );
                                  break;
                                default:
                                  break;
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 4, left: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.orangeAccent, // Border color
                                  width: 0.6, // Border width
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  gods[index],
                                  fit: BoxFit
                                      .scaleDown, // Ensure the image covers the circular area
                                  width:
                                      90, // Adjust the width according to your needs
                                  height:
                                      90, // Adjust the height according to your needs
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
            const SizedBox(height: 30),

            // slide images
            CarouselWithCards(
              imageUrls: [
                'assets/images/body/temple1.png',
                'assets/images/body/calendarbc.png',
                'assets/images/body/temple.png',
              ],
            ),
            //MonthlyCalendar(),
            const SizedBox(height: 30),
            // Image.asset(
            //   'assets/images/body/temple1.png',
            //   height: 300,
            //   width: 500,
            // ),
            // const SizedBox(height: 0),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/body/time_bg.png"), // Replace with your image path
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                // ignore: unnecessary_string_interpolations
                                '$formattedDate',
                                style: const TextStyle(
                                    fontSize: 70, color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                // ignore: unnecessary_string_interpolations
                                '${_getDaySuffix(int.parse(formattedDate))}',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    // ignore: unnecessary_string_interpolations
                                    '$formattedDayOfWeek',
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 1.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '$formattedMonth $formattedYear',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 8,
                  child: TextButton(
                    onPressed: () {
                      // Add functionality for "Show All" button here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CalendarEventsPage()), // Corrected the syntax
                      );
                    },
                    //backgroundColor: Colors.blue,
                    child: const Text(
                      'Show all',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.amber[700],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'List of Temples',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.amber[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 189.0,
              child: Align(
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length + 1, // Add one for the arrow icon
                  itemBuilder: (context, index) {
                    if (index < images.length) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the corresponding screen based on index
                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TempleLandingPage()),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TempleLandingPage()),
                              );
                              break;
                            default:
                              break;
                          }
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                              bottom: 10), // Margin around the card
                          // Adjusts the shadow beneath the card
                          child: Container(
                            width: 189.0, // Adjusted width for better fit
                            // margin:
                            // const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white, // Change color here
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(
                              //     color: Colors.black, width: 0.4)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Centered the content
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.asset(
                                    images[index],
                                    // height: ,
                                    // height:  MediaQuery.of(context)
                                    //   .size
                                    //   .height,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 5), // Adjusted spacing
                                Text(
                                  names[index],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the next screen here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoreScreen()),
                          );
                        },
                        child: Container(
                          width: 120.0, // Adjusted width for better fit
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: const ClipRect(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Centered the content
                              children: [
                                SizedBox(
                                  height: 60,
                                  child: Icon(Icons
                                      .arrow_forward_ios_rounded), // Right arrow icon
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'More',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.amber[700],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Popular Temples',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.amber[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 155.0,
              child: Align(
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: image.length + 1, // Add one for the arrow icon
                  itemBuilder: (context, index) {
                    if (index < image.length) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the corresponding screen based on index
                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TempleLandingPage()),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TempleLandingPage()),
                              );
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TempleLandingPage()),
                              );
                              break;
                            default:
                              break;
                          }
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                              bottom: 10), // Margin around the card
                          // Adjusts the shadow beneath the card
                          child: Container(
                            width: 130.0, // Adjusted width for better fit
                            // margin:
                            // const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white, // Change color here
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(
                              //     color: Colors.black, width: 0.4)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Centered the content
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.asset(
                                    image[index],
                                    // height: ,
                                    // height:  MediaQuery.of(context)
                                    //   .size
                                    //   .height,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 5), // Adjusted spacing
                                Text(
                                  popular[index],
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the next screen here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PopuplarTemple()),
                          );
                        },
                        child: Container(
                          width: 120.0, // Adjusted width for better fit
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: const ClipRect(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Centered the content
                              children: [
                                SizedBox(
                                  height: 60,
                                  child: Icon(Icons
                                      .arrow_forward_ios_rounded), // Right arrow icon
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'More',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

//live date, day, month, year

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}

// top slide image

class CarouselWithCards extends StatelessWidget {
  final List<String> imageUrls;

  CarouselWithCards({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjusted height
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: imageUrls.map((imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return ImageCard(imageUrl: imageUrl);
            },
          );
        }).toList(),
      ),
    );
  }
}
class ImageCard extends StatelessWidget {
  final String imageUrl;

  ImageCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5), // Added margin
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 16 / 9, // You can adjust this aspect ratio as needed
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover, // Use BoxFit.cover to fill the available space
          ),
        ),
      ),
    );
  }
}
