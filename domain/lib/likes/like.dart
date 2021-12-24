class Like{
  final bool isLiked;
  final int count;

  Like(
    this.isLiked,
    this.count
  );

  @override
  bool operator ==(Object other) {
    if (other is Like) {
      return isLiked == other.isLiked && count == other.count;
    }
    return super == other;
  }

  @override
  int get hashCode => Object.hash(isLiked, count);

}