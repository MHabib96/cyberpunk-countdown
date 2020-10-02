import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cyberpunkcountdown/models/countdown.dart';
import 'package:cyberpunkcountdown/utilities/extensions.dart';
import 'package:cyberpunkcountdown/types/time_type.dart';
import 'package:cyberpunkcountdown/services/countdown_service.dart';

class ScratchScreen extends StatefulWidget {
  final release = DateTime(2020, 09, 21, 0, 0, 0);

  @override
  _ScratchScreenState createState() => _ScratchScreenState();
}

class _ScratchScreenState extends State<ScratchScreen> {
  Timer _ticker;

  Countdown _countdown;

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
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Days - ', style: TextStyle(fontSize: 32)),
                //Text('${_countdown.totalDays}', style: TextStyle(fontSize: 42)),
                SizedBox(width: 10),
                Text('${_countdown.days}', style: TextStyle(fontSize: 42)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Hours - ', style: TextStyle(fontSize: 32)),
                //Text('${_countdown.totalHours}', style: TextStyle(fontSize: 42)),
                SizedBox(width: 10),
                Text('${_countdown.hours}', style: TextStyle(fontSize: 42)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Minutes - ', style: TextStyle(fontSize: 32)),
                //Text('${_countdown.totalMinutes}', style: TextStyle(fontSize: 42)),
                SizedBox(width: 10),
                Text('${_countdown.minutes}', style: TextStyle(fontSize: 42)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Seconds - ', style: TextStyle(fontSize: 32)),
                //Text('${_countdown.totalSeconds}', style: TextStyle(fontSize: 42)),
                SizedBox(width: 10),
                Text('${_countdown.seconds}', style: TextStyle(fontSize: 42)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
