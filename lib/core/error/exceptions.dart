class WeakPasswordException implements Exception {}

class ExistedAccountException implements Exception {}

class ServerException implements Exception {
  ServerException([this.message]);
  final String? message;
}

class WrongPasswordException implements Exception {}
