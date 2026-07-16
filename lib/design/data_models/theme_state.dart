class ThemeState {
  final String themeId;
  final bool isLoading;
  final String? error;
  const ThemeState({this.themeId = 'light_default', this.isLoading = false, this.error});

  ThemeState copyWith({String? themeId, bool? isLoading, String? error}) {
    return ThemeState(themeId: themeId ?? this.themeId, isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
  }
}
