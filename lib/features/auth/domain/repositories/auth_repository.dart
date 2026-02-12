import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_mobile/core/error/failures.dart';
import 'package:horizon_mobile/features/auth/data/models/login_request.dart';
import 'package:horizon_mobile/features/auth/data/models/register_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> login(LoginRequest request);
  Future<Either<Failure, UserCredential>> register(RegisterRequest request);
  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
