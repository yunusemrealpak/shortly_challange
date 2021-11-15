extension DateExtensions on DateTime {
  String get earthDate {
    return "${this.year.toString()}-${this.month.toString()}-${this.day.toString()}";
  }
}