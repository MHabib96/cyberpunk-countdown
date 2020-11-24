import 'dart:async';

import 'package:cyberpunkcountdown/components/countdown_card.dart';
import 'package:cyberpunkcountdown/components/platform_showcase.dart';
import 'package:cyberpunkcountdown/models/countdown.dart';
import 'package:cyberpunkcountdown/services/countdown_service.dart';
import 'package:cyberpunkcountdown/types/label_type.dart';
import 'package:cyberpunkcountdown/types/time_type.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:cyberpunkcountdown/utilities/extensions.dart';
import 'package:cyberpunkcountdown/utilities/globals.dart' as globals;
import 'package:flutter/material.dart';

class CountdownScreen extends StatefulWidget {
  final release = DateTime(kReleaseYear, kReleaseMonth, kReleaseDay,
      kReleaseHour, kReleaseMinute, 0);

  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  Countdown _countdown;
  Timer _ticker;

  void configure() {
    var now = DateTime.now();
    var difference = widget.release.difference(now);
    var service = CountdownService();

    var days = difference.inDays.toTimeString().addZero();

    var hours = difference.inHours.toTimeString() == '00'
        ? '00'
        : service.calculateCountdown(TimeType.hours, now);

    var minutes = difference.inMinutes.toTimeString() == '00'
        ? '00'
        : service.calculateCountdown(TimeType.minutes, now);

    var seconds = difference.inSeconds.toTimeString() == '00'
        ? '00'
        : service.calculateCountdown(TimeType.seconds, now);

    _countdown = Countdown(days, hours, minutes, seconds);
  }

  @override
  void initState() {
    super.initState();
    configure();
    _ticker = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() => configure());
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Material(
      child: Stack(
        children: <Widget>[
          Image.asset(
            globals.localStorage.getBackground(),
            width: screenSize.width,
            height: screenSize.height,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(globals.localStorage.getLogo()),
              CountdownCard(
                countdown: _countdown,
                valueFontSize: 40,
                labelFontSize: 20,
                labelType: LabelType.normalShort,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: PlatformShowcase(
                screenHeight: screenSize.height,
                playstation4: true,
                xboxOne: true,
                pc: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
