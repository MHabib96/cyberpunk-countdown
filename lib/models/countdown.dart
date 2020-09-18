class Countdown {
  int _days;
  int _hours;
  int _minutes;
  int _seconds;

  //Just for testing
  final int totalDays;
  final int totalHours;
  final int totalMinutes;
  final int totalSeconds;

  Countdown({this.totalDays, this.totalHours, this.totalMinutes, this.totalSeconds}) {
    final _now = DateTime.now();
    _minutes = totalMinutes == 0 ? 0 : (Duration.minutesPerHour - _now.minute) - 1;
    _seconds = totalSeconds == 0 ? 0 : (Duration.secondsPerMinute - _now.second) - 1;
  }

  int get days => _days;

  int get hours => _hours;

  int get minutes => _minutes;

  int get seconds => _seconds;
}
