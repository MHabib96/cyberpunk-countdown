import 'dart:async';
import 'package:cyberpunkcountdown/components/countdown_card.dart';
import 'package:cyberpunkcountdown/services/countdown_service.dart';
import 'package:cyberpunkcountdown/types/label_type.dart';
import 'package:cyberpunkcountdown/types/time_type.dart';
import 'package:flutter/material.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:cyberpunkcountdown/models/countdown.dart';
import 'package:cyberpunkcountdown/utilities/extensions.dart';

class CountdownScreen extends StatefulWidget {
  final release =
      DateTime(kReleaseYear, kReleaseMonth, kReleaseDay, kReleaseHour, kReleaseMinute, 0);

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

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backgrounds/cp-yellow-background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logos/cp-black-logo.png'),
            CountdownCard(
              countdown: _countdown,
              valueFontSize: 40,
              labelFontSize: 20,
              labelType: LabelType.normalShort,
            ),
            SizedBox(height: 50),
            SizedBox(
              height: screenSize.height * 0.025,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'images/platform_logos/xb1_black_logo.png',
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'images/platform_logos/ps4_black_logo.png',
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'images/platform_logos/pc_black_logo.png',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
