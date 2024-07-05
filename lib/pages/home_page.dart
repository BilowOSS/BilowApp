// 🐦 Flutter imports:
import 'package:bilow_app/blocs/blocs.dart';
import 'package:bilow_app/configs/configs.dart';
import 'package:bilow_app/extensions/extensions.dart';
import 'package:bilow_app/widgets/widgets.dart';
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
  void dispose() {
    _valueCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ValueCubit<int>>(
      create: (context) => _valueCubit,
      child: ResponsiveLayout(
        mobile: OrientationLayout(
          portrait: _Mobile(
            title: widget.title,
          ),
        ),
        tablet: OrientationLayout(
          portrait: Container(
            color: Colors.red,
          ),
        ),
        desktop: OrientationLayout(
          portrait: Container(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final valueCubit = context.read<ValueCubit<int>>();

    return PlatformScaffold(
      appBar: PlatformAppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(title),
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
              bloc: valueCubit,
              builder: (context, value) {
                return GestureDetector(
                  onTap: () => valueCubit.value = value + 1,
                  child: Text(
                    '$value',
                    style: theme.textTheme.headlineMedium,
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
