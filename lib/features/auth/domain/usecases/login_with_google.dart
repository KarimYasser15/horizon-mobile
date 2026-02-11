import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_mobile/core/error/failures.dart';
import 'package:horizon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginWithGoogle {
  final AuthRepository repository;
  LoginWithGoogle(this.repository);
  Future<Either<Failure, UserCredential>> call() async {
    return await repository.signInWithGoogle();
  }
}
