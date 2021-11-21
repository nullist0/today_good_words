class DateString {
  final DateTime _date;

  DateString(DateTime date): _date = date;

  static DateString now() => DateString(DateTime.now());

  @override
  String toString() {
    return (_date.year * 10000 + _date.month * 100 + _date.day).toString();
  }
}