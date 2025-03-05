part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstants.splashScreen:
      return _pageBuilder(
        (_) => const SplashScreen(),
        settings: settings,
      );
    case RouteConstants.postscreen:
      return _pageBuilder(
        (_) => const SpacexScreen(),
        settings: settings,
      );
    case RouteConstants.spacexdetailscreen:
      return _pageBuilder(
        (_) {
          final args = settings.arguments as Map<String, dynamic>?;
          final String? spacexId = args?['id'] as String?;
          return SpacexDetailScreen(spacexId: spacexId);
        },
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}


class RouteConstants {
  const RouteConstants._();

  static const postscreen = "/postscreen";
  static const splashScreen = "/splashscreen";
  static const spacexdetailscreen = "/spacexdetailscreen";
}