// import 'package:flutter/material.dart';
// import 'guide_booking.dart';

// class GuideBookingScreen extends StatefulWidget {
//   @override
//   _GuideBookingScreenState createState() => _GuideBookingScreenState();
// }

// class _GuideBookingScreenState extends State<GuideBookingScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;

//   late DateTime _selectedDate = DateTime.now();
//   late TimeOfDay _selectedTime = TimeOfDay.now();
//   late String _selectedLocation = '';

//   // Controller for the TextFormField
//   TextEditingController _locationController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeIn,
//       ),
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.5),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );

//     // Start animations
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     // Dispose the controller
//     _locationController.dispose();
//     super.dispose();
//   }

//   void _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 30)),
//     );
//     if (pickedDate != null) {
//       setState(() {
//         _selectedDate = pickedDate;
//       });
//     }
//   }

//   void _selectTime(BuildContext context) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (pickedTime != null) {
//       setState(() {
//         _selectedTime = pickedTime;
//       });
//     }
//   }

//   void _navigateToBookNowPage(BuildContext context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => BookNowPage(
//           selectedDate: _selectedDate,
//           selectedTime: _selectedTime,
//           selectedLocation: _selectedLocation,
//           guideName: 'Sri',
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Book a Guide'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.info),
//             onPressed: () {
//               // Implement action on info icon press
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Image.asset(
//                   'assets/trainer_booking/guide.jpg',
//                   height: 200,
//                   width: double.infinity,
//                   fit: BoxFit.contain,
//                 ),
//                 const SizedBox(height: 20.0),
//                 const Text(
//                   'Select Date:',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _selectDate(context),
//                   child: Text(
//                       '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
//                 ),
//                 const SizedBox(height: 20.0),
//                 const Text(
//                   'Select Time:',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _selectTime(context),
//                   child: Text('${_selectedTime.hour}:${_selectedTime.minute}'),
//                 ),
//                 const SizedBox(height: 20.0),
//                 const Text(
//                   'Enter Location:',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//                 TextFormField(
//                   controller: _locationController,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter your location',
//                   ),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedLocation = value;
//                     });
//                   },
//                 ),
//                 const SizedBox(height: 20.0),
//                 SlideTransition(
//                   position: _slideAnimation,
//                   child: Center(
//                     child: Container(
//                       decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.amber.shade400, Colors.amber.shade700],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                       child: ElevatedButton(
//                         onPressed: () => _navigateToBookNowPage(context),
//                         child: const Text('Book Guide'),

//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
