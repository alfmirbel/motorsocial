class SocialObjectQuery {
  final String? preferredType;
  final int skip;
  final int limit;
  final Map<String, dynamic> filter;
  final List<String> sort;
  const SocialObjectQuery({this.preferredType, this.skip = 0, this.limit = 20, this.filter = const <String, dynamic>{}, this.sort = const <String>[]});
}
