import 'package:darshan_journey/screens/user/service/service.dart';
import 'package:flutter/material.dart';
import 'guide_model.dart';
import 'booking_form.dart';

class GuideList extends StatelessWidget {
  final List<Guide> guides =
      Guide.guideList(); // This line should correctly initialize the list.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text('Available Guides'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: guides.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top:20,right: 20,left: 20),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(guides[index].imageUrl),
                      ),
                      title: Text(guides[index].name),
                      subtitle: Text(
                          '${guides[index].location} - ${guides[index].rating} Stars'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BookingForm(guide: guides[index])),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20), // Adjust the height as needed
        ],
      ),
    );
  }
}
