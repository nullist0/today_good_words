import 'package:flutter_test/flutter_test.dart';
import 'package:todaygoodwords/util/date.dart';

void main() {
  test('DateString Test', () {
    expect(DateTime(2020, 9, 30).toDateString(), '20200930');
    expect(DateTime(2020, 8, 1).toDateString(), '20200801');
  });
}