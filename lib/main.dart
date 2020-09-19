import 'package:cyberpunkcountdown/routing/router.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(CyberpunkCountdown());

class CyberpunkCountdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: kCountdownScreenRoute,
    );
  }
}
