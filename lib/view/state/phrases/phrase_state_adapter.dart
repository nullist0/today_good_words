import 'package:todaygoodwords/view/state/phrases/phrase_state.dart';

abstract class PhraseStateAdapter {
  Stream<PhraseState> states();
}