class User {
  final String uid;

  User(this.uid);

  @override
  bool operator ==(other) {
    if(other is User)
      return uid == other.uid;
    return false;
  }

  @override
  int get hashCode => super.hashCode;
}