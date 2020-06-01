extension DateTimeString on DateTime {
  /// return : YYYYMMDD 형식의 String
  String toDateString() => (year * 10000 + month * 100 + day).toString();
}