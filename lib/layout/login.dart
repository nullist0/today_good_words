import 'package:flutter/material.dart';
import 'package:todaygoodwords/model/data/users.dart';
import 'package:todaygoodwords/model/inherited_widget/user_inherited_widget.dart';
import 'package:todaygoodwords/model/stream_builder/user_stream_builder.dart';

class Login extends StatelessWidget {
  final Widget child;

  const Login({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserFirebaseStreamBuilder(
      loadingWidget: () => _buildChild(User.empty()),
      successWidget: _buildChild,
      failedWidget: () => _buildChild(User.empty()),
    );
  }

  Widget _buildChild(User user){
    print('USER : ${user.uid}');
    return UserInheritedWidget(
      user: user,
      child: child,
    );
  }
}
