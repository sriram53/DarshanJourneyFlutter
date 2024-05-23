import 'package:flutter/material.dart';


class GodButton extends StatelessWidget {
  final String templeName;
  final String templeLocation;
  final String imageUrl;
  final VoidCallback onPressed;

  const GodButton({
    Key? key,
    required this.templeName,
    required this.templeLocation,
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
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                //backgroundColor: Colors.amber[200],
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.orange.shade200,
                      Colors.orange.shade100,
                      //Colors.white12,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                //color: Colors.deepPurpleAccent,
                height: 130,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    // First column for image
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset(
                        imageUrl, // Add your image URL here
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.0), // Add some space between columns
                    // Second column for text
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            templeName,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4.0), // Add some space between texts
                          Divider(
                            color: Colors.black, // Set the color of the divider
                            thickness: 1.0, // Set the thickness of the divider
                          ),
                          SizedBox(
                              height:
                                  4.0), // Add some space between texts and the divider
                          Text(
                            templeLocation,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class GodMoreScreen extends StatefulWidget {
//   late final String godname;

//   GodMoreScreen({required this.godname});

//   @override
//   State<GodMoreScreen> createState() => _GodMoreScreenState();
// }

// class _GodMoreScreenState extends State<GodMoreScreen> {
//   final TextEditingController _searchController = TextEditingController();
//     bool isSearchClicked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.amber[700],
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios), // Icon for the back arrow
//           onPressed: () {
//             Navigator.pop(context); // Navigate back when pressed
//           },
//         ),
//         iconTheme: const IconThemeData(
//           color: Colors.black, // Change the color of the back arrow here
//         ),
//         title: isSearchClicked
//             ? Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: (context){},
//                   decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
//                       hintStyle: TextStyle(color: Colors.black),
//                       border: InputBorder.none,
//                       hintText: 'Search..'),
//                 ),
//               ) : Text(
//           '${widget.godname}',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 isSearchClicked = !isSearchClicked;
//                 if (!isSearchClicked) {
//                   _searchController.clear();

//                 }
//               });
//             },
//             icon: Icon(isSearchClicked ? Icons.close : Icons.search),
//           )
//         ],
//       ),
//       body: Center(
//         child: ListView(
//           children: [
//             GodButton(
//               templeName: 'Sri Ranganatha Swamy Temple',
//               templeLocation: 'Srirangam',
//               imageUrl: 'assets/images/body/temple1.png',
//               onPressed: () {
//                 // Add your logic here
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => TempleLandingPage()));
//               },
//             ),
//             GodButton(
//               templeName: 'Sri Arulmigu Ramanathaswamy Temple',
//               templeLocation: 'Rameswaram B',
//               imageUrl: 'assets/images/body/temple1.png',
//               onPressed: () {
//                 // Add your logic here
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => TempleLandingPage()));
//               },
//             ),
//             GodButton(
//               templeName: 'Brihadisvara Temple',
//               templeLocation: '	Thanjavur',
//               imageUrl: 'assets/images/body/temple1.png',
//               onPressed: () {
//                 // Add your logic here
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => TempleLandingPage()));
//               },
//             ),
//             GodButton(
//               templeName: 'Temple D',
//               templeLocation: 'Location D',
//               imageUrl: 'assets/images/body/temple1.png',
//               onPressed: () {
//                 // Add your logic here
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => TempleLandingPage()));
//               },
//             ),
//             GodButton(
//               templeName: 'Temple E',
//               templeLocation: 'Location E',
//               imageUrl: 'assets/images/body/temple1.png',
//               onPressed: () {
//                 // Add your logic here
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => TempleLandingPage()));
//               },
//             ),
//             // Add more TempleButton widgets here for additional temples
//           ],
//         ),
//       ),
//     );
//   }
// }
