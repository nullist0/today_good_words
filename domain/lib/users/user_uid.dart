class UserUID {
  final String uid;

  UserUID(this.uid);

  @override
  bool operator ==(Object other) {
    if (other is UserUID) {
      return uid == other.uid;
    }
    return super == other;
  }

  @override
  int get hashCode => uid.hashCode;
}