import 'package:cyberpunkcountdown/routing/app_router.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(CyberpunkCountdown());

class CyberpunkCountdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: kLoadingScreenRoute,
    );
  }
}
