import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/joke_list_screen.dart';
import 'screens/favorites_joke_screen.dart';
import 'providers/favorites_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/joke-list': (context) => JokeListScreen(),
        '/jokes': (context) => JokeListScreen(),
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}
