class RateLimitState {
  final int remaining;
  final DateTime? resetAt;
  const RateLimitState({this.remaining = -1, this.resetAt});

  RateLimitState copyWith({int? remaining, DateTime? resetAt}) {
    return RateLimitState(remaining: remaining ?? this.remaining, resetAt: resetAt ?? this.resetAt);
  }
}
