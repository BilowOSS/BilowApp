// 🐦 Flutter imports:
import 'package:bilow_app/enums/enums.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:bilow_app/bilow_app_app.dart';

void main() {
  testWidgets(
    'Counter increments smoke test',
    (tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const BilowAppApp(
        environment: Environment.staging,
      ));

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    },
  );
}
