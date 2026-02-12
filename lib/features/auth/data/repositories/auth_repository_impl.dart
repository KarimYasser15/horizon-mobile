import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_mobile/core/error/exceptions.dart';
import 'package:horizon_mobile/core/error/failures.dart';
import 'package:horizon_mobile/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:horizon_mobile/features/auth/data/models/login_request.dart';
import 'package:horizon_mobile/features/auth/data/models/register_request.dart';
import 'package:horizon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, UserCredential>> login(LoginRequest request) async {
    try {
      final UserCredential user = await _remoteDataSource.login(request);
      return Right(user);
    } on ExistedAccountException {
      return Left(ExistedAccountFailure());
    } on WrongPasswordException {
      return Left(WrongPasswordFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> register(
    RegisterRequest request,
  ) async {
    try {
      final UserCredential user = await _remoteDataSource.register(request);
      return Right(user);
    } on WeakPasswordException {
      return Left(WeakPasswordFailure());
    } on ExistedAccountException {
      return Left(ExistedAccountFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      final UserCredential user = await _remoteDataSource.signInWithGoogle();
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
