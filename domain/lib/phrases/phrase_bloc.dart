import 'package:domain/widget_state/base_widget_state.dart';

abstract class PhraseBloc<PhraseState extends BaseWidgetState> {
  Stream<PhraseState> states();
}