import 'package:flutter/material.dart';
import 'package:cyberpunkcountdown/models/countdown.dart';

class CountdownCard extends StatelessWidget {
  final Countdown countdown;
  final double spacing;
  final double valueFontSize;
  final double labelFontSize;
  final Color valueColor;
  final Color labelColor;

  CountdownCard({
    @required this.countdown,
    this.spacing,
    this.valueFontSize,
    this.labelFontSize,
    this.valueColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _SingleCountdownCard(
          label: 'Days',
          value: countdown.days,
          valueFontSize: valueFontSize ?? 20,
          labelFontSize: labelFontSize ?? 20,
          valueColor: valueColor ?? Colors.black,
          labelColor: labelColor ?? Colors.black,
        ),
        SizedBox(width: spacing ?? 10),
        _SingleCountdownCard(
          label: 'Hours',
          value: countdown.hours,
          valueFontSize: valueFontSize ?? 20,
          labelFontSize: labelFontSize ?? 20,
          valueColor: valueColor ?? Colors.black,
          labelColor: labelColor ?? Colors.black,
        ),
        SizedBox(width: spacing ?? 10),
        _SingleCountdownCard(
          label: 'Minutes',
          value: countdown.minutes,
          valueFontSize: valueFontSize ?? 20,
          labelFontSize: labelFontSize ?? 20,
          valueColor: valueColor ?? Colors.black,
          labelColor: labelColor ?? Colors.black,
        ),
        SizedBox(width: spacing ?? 10),
        _SingleCountdownCard(
          label: 'Seconds',
          value: countdown.seconds,
          valueFontSize: valueFontSize ?? 20,
          labelFontSize: labelFontSize ?? 20,
          valueColor: valueColor ?? Colors.black,
          labelColor: labelColor ?? Colors.black,
        ),
      ],
    );
  }
}

class _SingleCountdownCard extends StatelessWidget {
  final String label;
  final String value;
  final double valueFontSize;
  final double labelFontSize;
  final Color valueColor;
  final Color labelColor;

  _SingleCountdownCard({
    @required this.label,
    @required this.value,
    @required this.valueFontSize,
    @required this.labelFontSize,
    @required this.valueColor,
    @required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          value,
          style: TextStyle(
            fontSize: valueFontSize,
            color: valueColor,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: labelFontSize,
            color: labelColor,
          ),
        ),
      ],
    );
  }
}
