import 'package:clean_architecture_flutter/src/presentation/views/breaking_news_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route? onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return _materialRoute(const BreakingNewsView());
      default:
        return null;
    }
  }

}
