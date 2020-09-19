extension IntExtensions on int {
  String formatTotalTime() => this.isNegative ? '00' : this.toString();
}

extension StringExtensions on String {
  String addZero() => this.length == 1 ? '0' + this : this;
}
