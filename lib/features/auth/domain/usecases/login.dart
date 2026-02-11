import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_mobile/core/error/failures.dart';
import 'package:horizon_mobile/features/auth/data/models/login_request.dart';
import 'package:horizon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class Login {
  AuthRepository repository;
  Login(this.repository);
  Future<Either<Failure, UserCredential>> call(LoginRequest request) async {
    return await repository.login(request);
  }
}
