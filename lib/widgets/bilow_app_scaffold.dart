import 'package:bilow_app/extensions/extensions.dart';
import 'package:bilow_app/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class BilowAppScaffold extends StatelessWidget {
  const BilowAppScaffold({
    this.widgetKey,
    this.title,
    this.backgroundColor,
    this.leading,
    this.trailingActions,
    this.automaticallyImplyLeading,
    this.materialAppBar,
    this.cupertinoAppBar,
    this.body,
    super.key,
  });

  final Key? widgetKey;
  final String? title;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? trailingActions;
  final bool? automaticallyImplyLeading;
  final PlatformBuilder<MaterialAppBarData>? materialAppBar;
  final PlatformBuilder<CupertinoNavigationBarData>? cupertinoAppBar;
  final Widget? body;

  bool get _hasAppBar {
    return title != null ||
        leading != null ||
        trailingActions != null ||
        automaticallyImplyLeading != null ||
        materialAppBar != null ||
        cupertinoAppBar != null;
  }

  PlatformAppBar _platformAppBar(BuildContext context) {
    return PlatformAppBar(
      key: widgetKey,
      title: title != null ? Text(title!) : null,
      backgroundColor: backgroundColor ?? context.theme.primaryColor,
      leading: leading,
      trailingActions: trailingActions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      material: materialAppBar,
      cupertino: cupertinoAppBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return ResponsiveLayout(
      mobile: (context, orientation) {
        return PlatformScaffold(
          appBar: _hasAppBar ? _platformAppBar(context) : null,
          body: body,
        );
      },
      tablet: (context, orientation) {
        return PlatformScaffold(
          appBar: _hasAppBar ? _platformAppBar(context) : null,
          body: body,
        );
      },
      desktop: (context, orientation) {
        const contentWidth = 980.0;

        return Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                width: double.infinity,
                color: backgroundColor ?? theme.primaryColor,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: contentWidth),
                    child: Row(
                      children: <Widget>[
                        if (title != null) ...<Widget>[
                          Text(
                            title!,
                            style: theme.textTheme.titleLarge,
                          ),
                          const Spacer(),
                        ],
                        if (trailingActions != null) ...trailingActions!,
                      ],
                    ),
                  ),
                ),
              ),
              if (body != null)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    constraints: const BoxConstraints(maxWidth: contentWidth),
                    child: body!,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
