abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class RegisterSuccess extends AuthStates {}

class LoginSuccess extends AuthStates {}

class AuthFailure extends AuthStates {
  final String message;
  AuthFailure(this.message);
}
