// 🐦 Flutter imports:
import 'package:bilow_app/extensions/extensions.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

// 🌎 Project imports:
import 'package:bilow_app/pages/pages.dart';

part 'routes.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>();

// ---------------- Loading Route ---------------- //
@TypedGoRoute<LoadingRoute>(
  path: '/loading',
  name: 'loading',
)
@immutable
class LoadingRoute extends GoRouteData {
  const LoadingRoute();

  @override
  Page buildPage(context, state) {
    return platformPage(
      context: context,
      child: const LoadingPage(),
    );
  }
}

// ---------------- Error Route ---------------- //
@TypedGoRoute<ErrorRoute>(
  path: '/error',
  name: 'error',
)
@immutable
class ErrorRoute extends GoRouteData {
  const ErrorRoute();

  @override
  Page buildPage(context, state) {
    return platformPage(
      context: context,
      child: const ErrorPage(),
    );
  }
}

// ---------------- Home Routes ---------------- //
@TypedGoRoute<HomeRoute>(
  path: '/home',
  name: 'home',
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SettingsRoute>(
      path: 'settings',
      name: 'settings',
    ),
  ],
)
@immutable
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static final $navigatorKey = homeNavigatorKey;

  @override
  Page<void> buildPage(context, state) {
    return platformPage(
      context: context,
      child: HomePage(
        title: context.i18n.homePage.title,
      ),
    );
  }
}

@immutable
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page buildPage(context, state) {
    return platformPage(
      context: context,
      child: const SettingsPage(),
    );
  }
}
