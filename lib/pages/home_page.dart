// 🐦 Flutter imports:
import 'package:bilow_app/blocs/blocs.dart';
import 'package:bilow_app/configs/configs.dart';
import 'package:bilow_app/extensions/extensions.dart';
import 'package:bilow_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    final isDesktop = context.breakpoints.isDesktop;
    final i18n = context.i18n.homePage;
    final textTheme = context.theme.textTheme;
    final title = i18n.title;

    return BilowAppScaffold(
      title: title,
      trailingActions: <Widget>[
        PlatformIconButton(
          icon: Icon(context.platformIcons.settings),
          onPressed: () => const SettingsRoute().push(context),
        ),
      ],
      body: ResponsiveRowColumn(
        layout: isDesktop
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        columnCrossAxisAlignment: CrossAxisAlignment.stretch,
        columnMainAxisAlignment: MainAxisAlignment.center,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <ResponsiveRowColumnItem>[
          ResponsiveRowColumnItem(
            rowFlex: 2,
            child: Text(
              i18n.text,
              style: textTheme.headlineMedium,
              textAlign: isDesktop ? TextAlign.left : TextAlign.center,
            ),
          ),
          const ResponsiveRowColumnItem(
            child: SizedBox(
              height: 16.0,
              width: 16.0,
            ),
          ),
          ResponsiveRowColumnItem(
            child: BlocBuilder<ValueCubit<int>, int>(
              bloc: _valueCubit,
              builder: (context, value) {
                return ResponsiveRowColumn(
                  layout: ResponsiveRowColumnType.ROW,
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  children: <ResponsiveRowColumnItem>[
                    ResponsiveRowColumnItem(
                      child: PlatformIconButton(
                        icon: Icon(context.platformIcons.add),
                        onPressed: () => _valueCubit.value = value + 1,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: Text(
                        '$value',
                        style: isDesktop
                            ? textTheme.headlineLarge
                            : textTheme.headlineMedium,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: PlatformIconButton(
                        icon: Icon(context.platformIcons.remove),
                        onPressed: () => _valueCubit.value = value - 1,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
