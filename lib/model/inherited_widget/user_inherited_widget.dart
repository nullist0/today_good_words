import 'package:flutter/material.dart';
import 'package:todaygoodwords/model/data/users.dart';

class UserInheritedWidget extends InheritedWidget{

  final User user;
  final Widget child;

  UserInheritedWidget({this.user, this.child});

  @override
  bool updateShouldNotify(UserInheritedWidget oldWidget) {
    return oldWidget.user != user;
  }

  static User of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserInheritedWidget>().user;
  }
}
