import 'dart:async';
import 'package:cyberpunkcountdown/components/countdown_card.dart';
import 'package:cyberpunkcountdown/services/countdown_service.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/cp-skyscraper.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 200),
            CountdownCard(countdown: _countdown),
          ],
        ),
      ),
    );
  }
}
