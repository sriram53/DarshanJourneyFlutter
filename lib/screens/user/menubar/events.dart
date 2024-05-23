import 'package:flutter/material.dart';

class EventHomePage extends StatelessWidget {
  final List<Event> events = [
    Event(
      title: 'Maha Shiva Rathiri',
      location: 'Coimbatore',
      date: 'May 15, 2024',
      time: '10:00 AM - 1:00 PM',
      description:
          'Maha Shivaratri is a notable festival in Hinduism, marking a remembrance of "overcoming darkness and ignorance" in life and the world. It is observed by remembering Shiva and chanting prayers, fasting, and meditating on ethics and virtues such as honesty, non-injury to others, charity, forgiveness, and the discovery of Shiva.',
      image:'assets/images/body/calendarbc.png',
    ),
    Event(
      title: 'Soorasamharam',
      location: 'Thiruchendur',
      date: 'June 5, 2024',
      time: '9:00 AM - 6:00 PM',
      description: 'Description of Soorasamharam event goes here.',
      image:'assets/images/body/calendarbc.png',
    ),
    Event(
      title: 'Pooram Nakshatra',
      location: 'Thrissur',
      date: 'July 20, 2024',
      time: '6:00 PM - 8:00 PM',
      description: 'Thrissur Pooram (തൃശ്ശൂര്‍ പൂരം) was the brainchild of Sakthan Thampuran, the Maharaja of Cochin (1790–1805).[citation needed] Before the start of Thrissur Pooram, the largest temple festival in Kerala was the one-day festival held at Aarattupuzha known as Arattupuzha Pooram. Temples in and around the city of Thrissur were regular participants.',
      image:'assets/images/body/calendarbc.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Icon for the back arrow
          onPressed: () {
            Navigator.of(context).pop() ;// Navigate back when pressed
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: Text('Temple Events',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color:Colors.black,
        ),
        ), // Changed the title here
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return FadeInAnimation(
            delay: index * 200, // Apply delay to each card
            child: EventCard(event: events[index]),
          );
        },
      ),
    );
  }
}

class Event {
  final String title;
  final String location;
  final String date;
  final String time;
  final String description;
  final String image; // Added image field

  Event({
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    required this.description,
    required this.image, // Updated constructor
  });
}

class EventCard extends StatefulWidget {
  final Event event;

  EventCard({required this.event});

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          setState(() {
            _showDetails = !_showDetails;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.amber.shade300,
                Colors.amber.shade300,
                Colors.yellow.shade500,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Image added here
                Image.asset(
                  widget.event.image,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  widget.event.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                  Text(
                    'Location: ${widget.event.location}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Date: ${widget.event.date}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Time: ${widget.event.time}',
                    style: TextStyle(fontSize: 16),
                  ),
                if (_showDetails) ...[
                  SizedBox(height: 10),
                  Text(
                    'Description: ${widget.event.description}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Implement booking logic here
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Booking Confirmation'),
                              content: Text(
                                  'You have successfully booked ${widget.event.title}.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text('Book Event',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // TextButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       _showDetails = false;
                  //     });
                  //   },
                  //   child: Text('View Less'),
                  // ),
                ] else ...[
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showDetails = true;
                      });
                    },
                    child: Text('View More'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FadeInAnimation extends StatefulWidget {
  final int delay;
  final Widget child;

  FadeInAnimation({required this.delay, required this.child});

  @override
  _FadeInAnimationState createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 250),
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: widget.child,
    );
  }
}
