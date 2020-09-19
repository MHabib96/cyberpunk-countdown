import 'dart:async';
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
  DateTime _now;
  Duration _difference;
  Timer _ticker;

  Countdown _countdown;

  void configure() {
    _now = DateTime.now();
    _difference = widget.release.difference(_now);
    _countdown = Countdown(
      totalDays: _difference.inDays.formatTotalTime(),
      totalHours: _difference.inHours.formatTotalTime(),
      totalMinutes: _difference.inMinutes.formatTotalTime(),
      totalSeconds: _difference.inSeconds.formatTotalTime(),
    );
  }

  Widget singleCountdown(String label, String countdown) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(countdown, style: TextStyle(fontSize: 60)),
        Text(label, style: TextStyle(fontSize: 25)),
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
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Row(
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
      ),
    );
  }
}
