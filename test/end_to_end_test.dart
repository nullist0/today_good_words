import 'package:flutter_test/flutter_test.dart';

import 'application_runner.dart';

void main() {
  goodWordTestGroup();
}

void goodWordTestGroup() {
  group('Good Words Test', () {
    late ApplicationRunner app;
    setUp(() => {
      app = ApplicationRunner()
    });

    testWidgets('display failure message when failed to load words', (tester) async {
      await app.startApp(tester);
      app.displayWords('불러오기 실패했습니다');
    });
  });
}