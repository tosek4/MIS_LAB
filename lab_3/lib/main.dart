import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lab_3/firebase_options.dart';
import 'package:lab_3/screens/notification_screen.dart';
import 'package:lab_3/services/firebase_services.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/joke_list_screen.dart';
import 'screens/favorites_joke_screen.dart';
import 'providers/favorites_provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseServices().initNotifications();

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
      navigatorKey: navigatorKey,
      routes: {
        '/': (context) => HomeScreen(),
        '/joke-list': (context) => JokeListScreen(),
        '/jokes': (context) => JokeListScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/notification': (context) => NotificationScreen(),
      },
    );
  }
}
