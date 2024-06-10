import 'package:darshan_journey/screens/controllers/list_of_temple_controller.dart';
import 'package:flutter/material.dart';

class ImageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the data, show a loading indicator
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // If there's an error, display an error message
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // If data is available, display it
            List<dynamic> imageData = snapshot.data;
            return ListView.builder(
              itemCount: imageData.length,
              itemBuilder: (context, index) {
                var image = imageData[index];
                return ListTile(
                  leading: Image.network(image['imageUrl']),
                  title: Text(image['title']),
                  subtitle: Text(image['description']),
                );
              },
            );
          }
        },
      ),
    );
  }
}