import 'dart:async';
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

  Widget singleCountdown(String label, String countdown) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(countdown, style: TextStyle(fontSize: 60, color: Colors.white)),
        Text(label, style: TextStyle(fontSize: 25, color: Colors.white)),
      ],
    );
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                singleCountdown('Days', _countdown.days),
                SizedBox(width: 20),
                singleCountdown('Hours', _countdown.hours),
                SizedBox(width: 20),
                singleCountdown('Minutes', _countdown.minutes),
                SizedBox(width: 20),
                singleCountdown('Seconds', _countdown.seconds),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
