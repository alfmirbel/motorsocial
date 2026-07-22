class AuthState {
  final bool isUserDataLoaded;
  final String? errorCode;
  final String? errorMessage;
  final bool isAuthenticated;
  final String? userId;
  final String? accessToken;

  const AuthState({this.isUserDataLoaded = false, this.errorCode, this.errorMessage, this.isAuthenticated = false, this.userId, this.accessToken});

  AuthState copyWith({bool? isUserDataLoaded, String? errorCode, String? errorMessage, bool? isAuthenticated, String? userId, String? accessToken}) {
    return AuthState(isUserDataLoaded: isUserDataLoaded ?? this.isUserDataLoaded, errorCode: errorCode ?? this.errorCode, errorMessage: errorMessage ?? this.errorMessage, isAuthenticated: isAuthenticated ?? this.isAuthenticated, userId: userId ?? this.userId, accessToken: accessToken ?? this.accessToken);
  }
}
