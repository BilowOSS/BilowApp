// 🐦 Flutter imports:
import 'package:bilow_app/blocs/blocs.dart';
import 'package:bilow_app/configs/configs.dart';
import 'package:bilow_app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _valueCubit = ValueCubit<int>(0);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        trailingActions: <Widget>[
          PlatformIconButton(
            icon: Icon(context.platformIcons.settings),
            onPressed: () => const SettingsRoute().push(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<ValueCubit<int>, int>(
              bloc: _valueCubit,
              builder: (context, value) {
                return GestureDetector(
                  onTap: () => _valueCubit.value = value + 1,
                  child: Text(
                    '$value',
                    style: context.theme.textTheme.headlineMedium,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
