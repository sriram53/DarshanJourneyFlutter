import 'package:darshan_journey/screens/vendor/menu/vendor_menu.dart';
import 'package:flutter/material.dart';


class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({super.key}); // Corrected the syntax

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}



class _VendorHomeScreenState extends State<VendorHomeScreen> {


int _selectedIndex = 0;
  // ignore: unused_field
  final List<Widget> _pages = const <Widget>[
    VendorHomeScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: const VendorNavBar(),
        appBar: AppBar(

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
                //   MaterialPageRoute(builder: (context) => const NotificationScreen()),
                // );
              },
            ),

          ],

        ),
        //endDrawer: const NotificationScreen(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Image.asset(
                  'assets/images/body/temple.png',
                  height: 285,
                  width: 500,
                ),
                const SizedBox(height: 0),
                //MonthlyCalendar(),
                const SizedBox(height: 0),
                Image.asset(
                  'assets/images/body/temple1.png',
                  height: 300,
                  width: 500,
                ),
                const SizedBox(height: 0),
                Text(
                  '----------    LIST OF TEMPLES    ----------',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 120,
                      width: 500,
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/body/container/image1.png',
                              height: 80,
                              width: 80,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              'assets/images/body/container/image2.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              'assets/images/body/container/image.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '----------    POPULAR TEMPLES    ----------',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 120,
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            'assets/images/body/sizedbox/image4.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            'assets/images/body/sizedbox/image2.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            'assets/images/body/sizedbox/image.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            'assets/images/body/sizedbox/image3.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 0),

              ],
            ),
          ),

        ),
       // bottomNavigationBar: BottomScreen(key: UniqueKey())
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),

      ),
      );
  }

}


