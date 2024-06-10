// guide_model.dart
class Guide {
  final int id;
  final String name;
  final String location;
  final String description;
  final double rating;
  final String imageUrl;

  Guide({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.rating,
    required this.imageUrl,
  });

  static List<Guide> guideList() {
    return [
      Guide(
          id: 1,
          name: 'John Doe',
          location: 'Tanjavur',
          description: 'Experienced guide with historical knowledge.',
          rating: 4.5,
          imageUrl: 'assets/trainer_booking/guide1.jpg'),
      Guide(
          id: 2,
          name: 'Maria Clara',
          location: 'Palani',
          description: 'Friendly local expert.',
          rating: 4.8,
          imageUrl: 'assets/trainer_booking/guide2.jpg'),
      Guide(
          id: 3,
          name: 'Hans Becker',
          location: 'Madurai',
          description: 'Art and architecture specialist.',
          rating: 4.3,
          imageUrl: 'assets/trainer_booking/guide3.jpg'),
    ];
  }
}
