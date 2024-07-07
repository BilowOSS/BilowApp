import 'package:bilow_app/extensions/extensions.dart';
import 'package:bilow_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final i18n = context.i18n.settingsPage;

    return BilowAppScaffold(
      title: i18n.title,
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              i18n.items.theme.title,
            ),
            subtitle: Text(
              i18n.items.theme.subtitle(
                theme: context.isDarkMode
                    ? ThemeMode.light.name
                    : ThemeMode.dark.name,
              ),
            ),
            onTap: () {
              context.platformTheme?.themeMode =
                  context.isDarkMode ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
    );
  }
}
