import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_mobile/features/auth/data/models/login_request.dart';
import 'package:horizon_mobile/features/auth/data/models/register_request.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> register(RegisterRequest request);
  Future<UserCredential> login(LoginRequest request);
}
