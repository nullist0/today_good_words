import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todaygoodwords/model/data/users.dart';
import 'package:todaygoodwords/model/helper/user_helper.dart';

class UserFirebaseStreamBuilder extends StatelessWidget {
  final Widget Function(User) successWidget;
  final Widget Function() loadingWidget, failedWidget;

  const UserFirebaseStreamBuilder(
      {
        Key key,
        this.loadingWidget,
        this.successWidget,
        this.failedWidget
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthResult>(
        stream: AuthHelper().login().asStream(),
        builder: (context, snap){
          if(snap.hasData && snap.data != null)
            return successWidget(User.fromSnapshot(snap.data));
          else if(!snap.hasError && !snap.hasData)
            return loadingWidget();
          else
            return failedWidget();
        }
    );
  }
}
