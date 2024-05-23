import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopuplarTemple extends StatefulWidget {
  @override
  _PopuplarTempleState createState() => _PopuplarTempleState();
}

class _PopuplarTempleState extends State<PopuplarTemple> {
  late Future<List<dynamic>> _templeList;

  @override
  void initState() {
    super.initState();
    _templeList = fetchTemples();
  }

  Future<List<dynamic>> fetchTemples() async {
    final response = await http
        .get(Uri.parse('http://192.168.20.245:4000/home/getAllTemples'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      final List<dynamic> temples = parsed['result'];
      return temples;
    } else {
      throw Exception('Failed to load temple details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temple List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _templeList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<dynamic> temples = snapshot.data!;
            return ListView.builder(
              itemCount: temples.length,
              itemBuilder: (context, index) {
                final temple = temples[index];
                return Card(
                  child: ListTile(
                    leading: temple['main_image'] != null
                        ? SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(
                              temple['main_image'],
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                    title: Text(
                      temple['temple_name'],
                    ),
                    subtitle: Text(
                        '${temple['Cityname']}, ${temple['Districtname']}, ${temple['Statename']}, ${temple['Countryname']}'),
                    onTap: () {
                      // Handle tap on temple item
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PopuplarTemple(),
  ));
}
