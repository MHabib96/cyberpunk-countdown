import 'package:flutter/material.dart';
import 'package:cyberpunkcountdown/models/countdown.dart';
import 'package:cyberpunkcountdown/types/label_type.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';

class CountdownCard extends StatelessWidget {
  final Countdown countdown;
  final double spacing;
  final double valueFontSize;
  final double labelFontSize;
  final Color valueColor;
  final Color labelColor;
  final LabelType labelType;

  CountdownCard({
    @required this.countdown,
    this.spacing,
    this.valueFontSize,
    this.labelFontSize,
    this.valueColor,
    this.labelColor,
    this.labelType,
  });

  List<String> getLabels(LabelType labelType) {
    switch (labelType) {
      case LabelType.lowerLong:
        return kLongLabels.map((e) => e.toLowerCase()).toList();
      case LabelType.lowerShort:
        return kShortLabels.map((e) => e.toLowerCase()).toList();
      case LabelType.normalLong:
        return kLongLabels;
      case LabelType.normalShort:
        return kShortLabels;
      case LabelType.upperLong:
        return kLongLabels.map((e) => e.toUpperCase()).toList();
      case LabelType.upperShort:
        return kShortLabels.map((e) => e.toUpperCase()).toList();
      default:
        return kLongLabels;
    }
  }

  @override
  Widget build(BuildContext context) {
    var labels = getLabels(labelType);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _SingleCountdownCard(
          label: labels[0],
          value: countdown.days,
          valueFontSize: valueFontSize ?? 20,
          labelFontSize: labelFontSize ?? 20,
          valueColor: valueColor ?? Colors.black,
          labelColor: labelColor ?? Colors.black,
        ),
        SizedBox(width: spacing ?? 10),
        _SingleCountdownCard(
          label: labels[1],
          value: countdown.hours,
          valueFontSize: valueFontSize ?? 20,
          labelFontSize: labelFontSize ?? 20,
          valueColor: valueColor ?? Colors.black,
          labelColor: labelColor ?? Colors.black,
        ),
        SizedBox(width: spacing ?? 10),
        _SingleCountdownCard(
          label: labels[2],
          value: countdown.minutes,
          valueFontSize: valueFontSize ?? 20,
          labelFontSize: labelFontSize ?? 20,
          valueColor: valueColor ?? Colors.black,
          labelColor: labelColor ?? Colors.black,
        ),
        SizedBox(width: spacing ?? 10),
        _SingleCountdownCard(
          label: labels[3],
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
