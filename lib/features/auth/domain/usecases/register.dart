import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_mobile/core/error/failures.dart';
import 'package:horizon_mobile/features/auth/data/models/register_request.dart';
import 'package:horizon_mobile/features/auth/domain/repositories/auth_repository.dart';

class Register {
  AuthRepository repository;
  Register(this.repository);
  Future<Either<Failure, UserCredential>> call(RegisterRequest request) async {
    return await repository.register(request);
  }
}
