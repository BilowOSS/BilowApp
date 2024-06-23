// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:bilow_app/enums/enums.dart';
import 'package:bilow_app/pages/pages.dart';

class BilowAppApp extends StatelessWidget {
  const BilowAppApp({
    required this.environment,
    super.key,
  });

  final Environment environment;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: environment == Environment.development,
      title: 'BilowApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(
        title: 'BilowApp Home Page',
      ),
    );
  }
}
