import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('description', () {
    var s = StreamController();
    var f = Stream.periodic(Duration(seconds: 1), (c) => c);
    s.stream.asyncExpand((event) => f).listen(print);

    s.sink.add(10);
    s.sink.add(11);
    s.sink.add(12);
    s.sink.add(13);

    s.close();
  });
}
