import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/my_app.dart';
import 'package:rick_and_morty_app/repository/character_repository.dart';
import 'package:rick_and_morty_app/screens/character_screen/character_view_model.dart';
import 'package:rick_and_morty_app/service/api_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CharacterViewModel(
            CharacterRepository(ApiService()),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
