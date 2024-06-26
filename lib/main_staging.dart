// 🐦 Flutter imports:
import 'package:bilow_app/configs/dependencies.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:bilow_app/enums/enums.dart';
import 'package:bilow_app/bilow_app_app.dart';
import 'package:flutter_app_info/flutter_app_info.dart';

Future<void> main() async {
  await initDependencies();

  runApp(
    AppInfo(
      data: await AppInfoData.get(),
      child: const BilowAppApp(
        environment: Environment.staging,
      ),
    ),
  );
}
