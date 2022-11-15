import 'package:flutter/material.dart';

import '../../features/chucks/presentation/pages/home_page.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    final availableRoutes = getAvailableRoutes(args);
    final page = availableRoutes[settings.name]!;
    return MaterialPageRoute(settings: settings, builder: page);
  }

  static Map<String, WidgetBuilder> getAvailableRoutes(Map? args) {
    return {AppRoutes.homePage: (_) => const HomePage()};
  }
}
