import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';
import '../services/firebase_services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseServices _firebaseServices = FirebaseServices();

    _firebaseServices.initNotifications();

    final dummyMessage = RemoteMessage(
      notification: RemoteNotification(title: 'Test Title', body: 'Test Body'),
      data: {'key': 'value'},
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Joke types'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
          ),
          IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: () {
              Navigator.pushNamed(context, '/random-joke');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/notification',
                  arguments: dummyMessage);
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: JokeApiService.getJokeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            List<String> jokeTypes = snapshot.data!;
            return ListView.builder(
              itemCount: jokeTypes.length,
              itemBuilder: (context, index) {
                return JokeCard(type: jokeTypes[index]);
              },
            );
          }
        },
      ),
    );
  }
}
