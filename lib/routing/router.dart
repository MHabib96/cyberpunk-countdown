import 'package:cyberpunkcountdown/screens/countdown_screen.dart';
import 'package:cyberpunkcountdown/screens/scratch_screen.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kCountdownScreenRoute:
        return MaterialPageRoute(builder: (_) => CountdownScreen());
      case kScratchScreenRoute:
        return MaterialPageRoute(builder: (_) => ScratchScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
