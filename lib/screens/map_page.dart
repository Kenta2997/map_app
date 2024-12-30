import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/event.dart';
import '../models/musician.dart';
import '../service/eventService.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController _mapController = MapController();
  double _zoom = 14.0;
  LatLng _center = LatLng(35.681, 139.767); // 初期表示の中心座標
  Event? _selectedEvent;
  late Future<List<Event>> _eventsFuture;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  void _fetchEvents() {
    setState(() {
      _eventsFuture = EventService().getEvents(date: _selectedDate, location: _center);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (picked != null && picked != _selectedDate) {
                setState(() {
                  _selectedDate = picked;
                  _fetchEvents();
                });
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Event>>(
        future: _eventsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final events = snapshot.data!;
            return Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _center,
                    initialZoom: _zoom,
                    onTap: (_, __) => setState(() => _selectedEvent = null),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.map_app',
                    ),
                    MarkerLayer(
                      markers: events.map((event) => Marker(
                        point: event.location,
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedEvent = event),
                          child: const Icon(Icons.location_on, size: 40, color: Colors.red),
                        ),
                      )).toList(),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Column(
                    children: [
                      FloatingActionButton(
                        heroTag: "btn1",
                        mini: true,
                        onPressed: () {
                          final newZoom = _mapController.camera.zoom + 1;
                          _mapController.move(_mapController.camera.center, newZoom);
                        },
                        child: const Icon(Icons.add),
                      ),
                      FloatingActionButton(
                        heroTag: "btn2",
                        mini: true,
                        onPressed: () {
                          final newZoom = _mapController.camera.zoom - 1;
                          _mapController.move(_mapController.camera.center, newZoom);
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
                if (_selectedEvent != null) _buildEventDetails(_selectedEvent!),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildEventDetails(Event event) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            event.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Center(child: Text('Image failed to load')),
          ),
          const SizedBox(height: 10),
          Text(event.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(event.description, style: const TextStyle(fontSize: 16)),
          Text('${event.date.year}年${event.date.month}月${event.date.day}日', style: const TextStyle(fontSize: 16)),
          Text('出演者:', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ...event.musicians.map((musician) => Text('- ${musician.name}', style: const TextStyle(fontSize: 16))).toList(),
        ],
      ),
    );
  }
}