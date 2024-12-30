import 'package:latlong2/latlong.dart';
import 'musician.dart';

class Event {
  final int id;
  final String name;
  final String description;
  final DateTime date;
  final LatLng location;
  final List<Musician> musicians;
  final String imageUrl;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
    required this.musicians,
    required this.imageUrl,
  });
}