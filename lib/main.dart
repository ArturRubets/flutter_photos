import 'package:flutter/material.dart';

import 'data/api_client.dart';
import 'data/configuration.dart';

void main() async {
  final client = PhotoApiClient();
  final photos = await client.photos(Configuration.clientId);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}
