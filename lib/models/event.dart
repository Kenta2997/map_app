import 'package:latlong2/latlong.dart';
import 'musician.dart';

class Event {
  final int id; // eventId -> id に修正
  final String name;
  final String description;
  final DateTime date;
  final LatLng location;
  final List<Musician> musicians;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
    required this.musicians,
  });
}