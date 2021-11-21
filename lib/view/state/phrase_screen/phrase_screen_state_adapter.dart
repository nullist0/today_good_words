import 'package:todaygoodwords/view/state/phrase_screen/phrase_screen_state.dart';

abstract class PhraseScreenStateAdapter {
  Stream<PhraseScreenState> states();
}