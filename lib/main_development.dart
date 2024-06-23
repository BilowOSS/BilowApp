// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:bilow_app/enums/enums.dart';
import 'package:bilow_app/bilow_app_app.dart';

Future<void> main() async {
  runApp(
    await bilowApp(
      environment: Environment.development,
    ),
  );
}
