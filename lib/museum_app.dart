import 'package:flutter/material.dart';
import 'artwork.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Museum",
      theme: ThemeData(
          primarySwatch: Colors.brown, secondaryHeaderColor: Colors.brown),
      home: const Artwork(),
    );
  }
}
