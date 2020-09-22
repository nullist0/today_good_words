class User {
  final String uid;

  User(this.uid);

  @override
  bool operator ==(other) {
    return uid == other.uid;
  }

  @override
  int get hashCode => super.hashCode;
}