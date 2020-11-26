import 'package:cyberpunkcountdown/screens/countdown_screen.dart';
import 'package:cyberpunkcountdown/screens/loading_screen.dart';
import 'package:cyberpunkcountdown/screens/scratch_screen.dart';
import 'package:cyberpunkcountdown/screens/settings_screen.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kLoadingScreenRoute:
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      case kCountdownScreenRoute:
        return MaterialPageRoute(builder: (_) => CountdownScreen());
      case kSettingsScreenRoute:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
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
