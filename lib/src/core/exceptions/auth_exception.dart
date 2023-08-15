class AuthException implements Exception {
  final String message;
  AuthException({required this.message});
}

class AuthError extends AuthException {
  AuthError({required String message}) : super(message: message);
}

class AuthUnauthorizedException extends AuthException {
  AuthUnauthorizedException() : super(message: '');
}
