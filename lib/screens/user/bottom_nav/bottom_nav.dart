import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account/edit_profile_screen.dart';
import '../blog/blog.dart';
import '../home/home.dart';
import '../service/service.dart';

class BottomNavigationBar1 extends StatefulWidget {
  const BottomNavigationBar1({super.key});

  @override
  State<BottomNavigationBar1> createState() => _BottomNavigationBar1State();
}

class _BottomNavigationBar1State extends State<BottomNavigationBar1> {



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      //backgroundColor: Colors.orangeAccent,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
            width: 0.5,
            color: Colors.black.withOpacity(0.5), // Add black border on top
          )),
        ),
        child: Obx(() => NavigationBar(
              backgroundColor: Colors.white70,
              height: 75,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              destinations: [
                NavigationDestination(
                  icon: controller.selectedIndex.value == 0
                      ?  Icon(Icons.home, color: Colors.amber[700])
                      : const Icon(Icons.home_outlined),
                  label: "Home",
                ),
                NavigationDestination(
                    icon: controller.selectedIndex.value == 1
                        ?  Icon(Icons.temple_hindu,
                            color:Colors.amber[700])
                        : const Icon(Icons.temple_hindu),
                    label: "Service"),
                NavigationDestination(
                  icon: controller.selectedIndex.value == 2
                      ?  Icon(Icons.bookmark_add,
                          color: Colors.amber[700])
                      : const Icon(Icons.bookmark_add),
                  label: "Blog",
                ),
                NavigationDestination(
                    icon: controller.selectedIndex.value == 3
                        ?  Icon(IconsaxPlusBold.profile_circle,
                            color: Colors.amber[700])
                        : const Icon(IconsaxPlusBold.profile_circle),
                    label: "Account"),
              ],
              // onTap: _onItemTapped
            )),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    Cards(),
      BlogScreen(),
    const EditProfileScreen(),
  ];

}


