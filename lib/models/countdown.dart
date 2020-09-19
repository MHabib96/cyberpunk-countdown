import 'package:cyberpunkcountdown/services/countdown_service.dart';
import 'package:cyberpunkcountdown/types/time.dart';
import 'package:cyberpunkcountdown/utilities/extensions.dart';

class Countdown {
  String _days;
  String _hours;
  String _minutes;
  String _seconds;

  var _service = CountdownService();

  Countdown({String totalDays, String totalHours, String totalMinutes, String totalSeconds}) {
    final _now = DateTime.now();
    _days = totalDays.addZero();
    _hours = totalHours == '00' ? '00' : _service.formatCountdown(Time.hours, _now);
    _minutes = totalMinutes == '00' ? '00' : _service.formatCountdown(Time.minutes, _now);
    _seconds = totalSeconds == '00' ? '00' : _service.formatCountdown(Time.seconds, _now);
  }

  String get days => _days;

  String get hours => _hours;

  String get minutes => _minutes;

  String get seconds => _seconds;
}
