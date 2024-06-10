// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarEventsPage extends StatefulWidget {
  const CalendarEventsPage({super.key});

  @override
  _CalendarEventsPageState createState() => _CalendarEventsPageState();
}

class _CalendarEventsPageState extends State<CalendarEventsPage> {
  List<calendar.Event> _events = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    setState(() {
      _isLoading = true;
    });

    final clientId = ClientId('<YOUR_CLIENT_ID>', '<YOUR_CLIENT_SECRET>');
    final scopes = [calendar.CalendarApi.calendarReadonlyScope];
    final client = await clientViaUserConsent(clientId, scopes, prompt);

    final calendarApi = calendar.CalendarApi(client);
    final now = DateTime.now().toUtc();
    final minTime = DateTime(now.year, now.month, now.day).toUtc();
    final maxTime = minTime
        .add(const Duration(days: 7)); // Fetch events for the next 7 days

    final response = await calendarApi.events
        .list('primary', timeMin: minTime, timeMax: maxTime);

    setState(() {
      _events = response.items!;
      _isLoading = false;
    });
  }

  void prompt(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Calendar Events'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                return ListTile(
                  title: Text(event.summary ?? 'No summary available'),
                  subtitle: Text(event.start!.dateTime.toString()),
                );
              },
            ),
    );
  }
}
