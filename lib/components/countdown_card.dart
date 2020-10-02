import 'package:flutter/material.dart';
import 'package:cyberpunkcountdown/models/countdown.dart';

class CountdownCard extends StatelessWidget {
  final Countdown countdown;
  final double spacing;

  CountdownCard({@required this.countdown, this.spacing});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _SingleCountdownCard(label: 'Days', value: countdown.days),
        SizedBox(width: spacing ?? 20),
        _SingleCountdownCard(label: 'Hours', value: countdown.hours),
        SizedBox(width: spacing ?? 20),
        _SingleCountdownCard(label: 'Minutes', value: countdown.minutes),
        SizedBox(width: spacing ?? 20),
        _SingleCountdownCard(label: 'Seconds', value: countdown.seconds),
      ],
    );
  }
}

class _SingleCountdownCard extends StatelessWidget {
  final String label;
  final String value;

  _SingleCountdownCard({this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(value, style: TextStyle(fontSize: 60, color: Colors.white)),
        Text(label, style: TextStyle(fontSize: 25, color: Colors.white)),
      ],
    );
  }
}
