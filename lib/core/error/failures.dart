import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure()
    : super('Password is too weak. Please choose a stronger password.');
}

class ExistedAccountFailure extends Failure {
  const ExistedAccountFailure() : super('This email is already registered.');
}

class NoUserFailure extends Failure {
  const NoUserFailure() : super('No account found with this email.');
}

class WrongPasswordFailure extends Failure {
  const WrongPasswordFailure() : super('Incorrect password. Please try again.');
}

class NotLoggedInFailure extends Failure {
  const NotLoggedInFailure()
    : super('You must be logged in to perform this action.');
}

class TooManyRequestsFailure extends Failure {
  const TooManyRequestsFailure()
    : super('Too many attempts. Please try again later.');
}

class ServerFailure extends Failure {
  const ServerFailure([String? message])
      : super(message ?? 'Something went wrong. Please try again.');
}
