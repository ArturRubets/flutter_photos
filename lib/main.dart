import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/api_client.dart';
import 'data/configuration.dart';
import 'ui/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => PhotoApiClient()),
        Provider(create: (_) => Configuration.clientId),
      ],
      child: const App(),
    ),
  );
}
