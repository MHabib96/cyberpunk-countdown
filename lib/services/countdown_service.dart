import 'package:cyberpunkcountdown/types/time_type.dart';
import 'package:cyberpunkcountdown/utilities/extensions.dart';

class CountdownService {
  int _getCountdownHour(int hour) => (Duration.hoursPerDay - hour) - 1;

  int _getCountdownMinute(int minute) => (Duration.minutesPerHour - minute) - 1;

  int _getCountdownSecond(int second) => (Duration.secondsPerMinute - second) - 1;

  String calculateCountdown(TimeType time, DateTime now) {
    switch (time) {
      case TimeType.hours:
        return _getCountdownHour(now.hour).toString().addZero();
      case TimeType.minutes:
        return _getCountdownMinute(now.minute).toString().addZero();
      case TimeType.seconds:
        return _getCountdownSecond(now.second).toString().addZero();
      default:
        return 'Time format $time not recognised';
    }
  }
}
