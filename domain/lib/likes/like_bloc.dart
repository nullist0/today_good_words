import 'package:domain/widget_state/base_widget_state.dart';

abstract class LikeBloc<LikeState extends BaseWidgetState> {
  Stream<LikeState> states();
  Future<void> switchLike();
}