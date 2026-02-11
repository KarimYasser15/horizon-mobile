import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_mobile/features/auth/data/models/login_request.dart';
import 'package:horizon_mobile/features/auth/data/models/register_request.dart';
import 'package:horizon_mobile/features/auth/domain/usecases/login.dart';
import 'package:horizon_mobile/features/auth/domain/usecases/login_with_google.dart';
import 'package:horizon_mobile/features/auth/domain/usecases/register.dart';
import 'package:horizon_mobile/features/auth/presentation/cubit/auth_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._login, this._register, this._loginWithGoogle)
      : super(AuthInitial());
  final Login _login;
  final Register _register;
  final LoginWithGoogle _loginWithGoogle;

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final result = await _login(LoginRequest(email: email, password: password));
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (userCredential) =>
          emit(LoginSuccess(displayName: userCredential.user?.displayName)),
    );
  }

  Future<void> register(String fullName, String email, String password) async {
    emit(AuthLoading());
    final result = await _register(
      RegisterRequest(fullName: fullName, email: email, password: password),
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (userCredential) => emit(RegisterSuccess()),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    final result = await _loginWithGoogle();
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (userCredential) =>
          emit(LoginSuccess(displayName: userCredential.user?.displayName)),
    );
  }
}
