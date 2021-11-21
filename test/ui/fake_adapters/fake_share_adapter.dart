import 'package:mockito/annotations.dart';
import 'package:todaygoodwords/shares/share_adapter.dart';

import 'fake_share_adapter.mocks.dart';

@GenerateMocks([ShareAdapter])
extension FakeShareAdapter on ShareAdapter {
  static ShareAdapter fake() => MockShareAdapter();
}