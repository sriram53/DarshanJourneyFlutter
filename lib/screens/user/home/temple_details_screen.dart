import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  late Future<List<dynamic>> _templeList;

  @override
  void initState() {
    super.initState();
    _templeList = fetchTemples();
  }

  Future<List<dynamic>> fetchTemples() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.1.18:4000/home/getAllTemples'));

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        if (parsed['result'] != null) {
          final List<dynamic> temples = parsed['result'];
          return temples;
        } else {
          throw Exception('No result key found in the response');
        }
      } else {
        throw Exception(
            'Failed to load temple details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TempleDetailScreen(temple: temple),
                        ),
                      );
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

class TempleDetailScreen extends StatefulWidget {
  final Map<String, dynamic> temple;

  TempleDetailScreen({required this.temple});

  @override
  _TempleDetailScreenState createState() => _TempleDetailScreenState();
}

class _TempleDetailScreenState extends State<TempleDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.temple['temple_name']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.temple['main_image'] != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(widget.temple['main_image']),
                )
              : SizedBox.shrink(),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'About'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.temple['temple_name'],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '${widget.temple['Cityname']}, ${widget.temple['Districtname']}, ${widget.temple['Statename']}, ${widget.temple['Countryname']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16.0),
                      if (widget.temple['description'] != null) ...[
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          widget.temple['description'],
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 16.0),
                      ],
                      if (widget.temple['temple_history'] != null) ...[
                        Text(
                          'History',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          widget.temple['temple_history'],
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 16.0),
                      ],
                      if (widget.temple['incharge_name'] != null ||
                          widget.temple['incharge_phone'] != null) ...[
                        Text(
                          'Contact details',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        if (widget.temple['incharge_name'] != null)
                          Text(
                            'Name: ${widget.temple['incharge_name']}',
                            style: TextStyle(fontSize: 14),
                          ),
                        if (widget.temple['phone_number'] != null)
                          Text(
                            'Phone: ${widget.temple['phone_number']}',
                            style: TextStyle(fontSize: 14),
                          ),
                        if (widget.temple['temple_mailid'] != null)
                          Text(
                            'MailID: ${widget.temple['temple_mailid']}',
                            style: TextStyle(fontSize: 14),
                          ),
                        if (widget.temple['temple_website'] != null)
                          Text(
                            'WebSite: ${widget.temple['temple_website']}',
                            style: TextStyle(fontSize: 14),
                          ),
                        SizedBox(height: 16.0),
                      ],
                      if (widget.temple['pooja_timings'] != null) ...[
                        Text(
                          'pooja timings',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          widget.temple['pooja_timings'],
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                      SizedBox(
                        height: 16.0,
                      ),
                      if (widget.temple['temple_year'] != null) ...[
                        Text(
                          'Year',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          widget.temple['temple_year'],
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                      SizedBox(
                        height: 18.0,
                      ),
                      if (widget.temple['pariharam'] != null) ...[
                        Text(
                          'pariharam',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          widget.temple['pariharam'],
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                      // Add more details as needed
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.temple['temple_additional'] != null) ...[
                        Text(
                          'About',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          widget.temple['temple_additional'],
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 16.0),
                      ],
                      if (widget.temple['bookingFields'] != null) ...[
                        Text(
                          'Bookings',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          widget.temple['bookingFields'],
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 16.0),
                      ],
                      if (widget.temple['temple_address'] != null) ...[
                        Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          widget.temple['temple_address'],
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MoreScreen(),
  ));
}
