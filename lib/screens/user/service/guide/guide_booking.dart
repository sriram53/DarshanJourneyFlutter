// import 'package:flutter/material.dart';

// class BookNowPage extends StatelessWidget {
//   final DateTime selectedDate;
//   final TimeOfDay selectedTime;
//   final String selectedLocation;
//   final String guideName;

//   BookNowPage({
//     required this.selectedDate,
//     required this.selectedTime,
//     required this.selectedLocation,
//     required this.guideName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book Now'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Guide Name:',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(
//               'Selected Date:',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(
//                 '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
//             SizedBox(height: 20.0),
//             Text(
//               'Selected Time:',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text('${selectedTime.hour}:${selectedTime.minute}'),
//             SizedBox(height: 20.0),
//             Text(
//               'Selected Location:',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(selectedLocation),
//             SizedBox(height: 20.0),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Implement booking logic here
//                   // For now, let's just navigate back
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Confirm Booking'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
