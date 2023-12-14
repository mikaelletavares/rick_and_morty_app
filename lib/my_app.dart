import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/character_screen/character_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Characters',
      home: CharacterScreen(),
    );
  }
}
