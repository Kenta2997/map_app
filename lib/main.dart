import 'package:flutter/material.dart';
import 'package:map_app/screens/home_page.dart';
import 'package:map_app/screens/map_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
       routes: {
        '/map': (context) => const MapWidget(),
      },
    );
  }
}