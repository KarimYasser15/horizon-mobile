import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_mobile/core/error/exceptions.dart';
import 'package:horizon_mobile/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:horizon_mobile/features/auth/data/models/login_request.dart';
import 'package:horizon_mobile/features/auth/data/models/register_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  AuthApiRemoteDataSource(this._firebaseAuth);

  @override
  Future<UserCredential> login(LoginRequest request) async {
    try {
      final UserCredential user = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ExistedAccountException();
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        throw WrongPasswordException();
      } else {
        throw ServerException(e.message);
      }
    }
  }

  @override
  Future<UserCredential> register(RegisterRequest request) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );

      final user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName(request.fullName);
        await user.reload();
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw ExistedAccountException();
      } else {
        throw ServerException(e.message);
      }
    }
  }
}
