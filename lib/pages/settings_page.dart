import 'package:bilow_app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(context.i18n.settingsPage.title),
        trailingActions: <Widget>[
          PlatformIconButton(
            icon: Icon(context.platformIcons.back),
            onPressed: () => context.pop(),
          ),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(),
        ],
      ),
    );
  }
}
