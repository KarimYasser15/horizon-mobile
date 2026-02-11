// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:horizon_mobile/core/di/firebase_module.dart' as _i300;
import 'package:horizon_mobile/features/auth/data/data_source/auth_api_remote_data_source.dart'
    as _i775;
import 'package:horizon_mobile/features/auth/data/data_source/auth_remote_data_source.dart'
    as _i825;
import 'package:horizon_mobile/features/auth/data/repositories/auth_repository_impl.dart'
    as _i52;
import 'package:horizon_mobile/features/auth/domain/repositories/auth_repository.dart'
    as _i457;
import 'package:horizon_mobile/features/auth/domain/usecases/login.dart'
    as _i262;
import 'package:horizon_mobile/features/auth/domain/usecases/login_with_google.dart'
    as _i95;
import 'package:horizon_mobile/features/auth/domain/usecases/register.dart'
    as _i715;
import 'package:horizon_mobile/features/auth/presentation/cubit/auth_cubit.dart'
    as _i650;
import 'package:horizon_mobile/features/home/data/data_source/home_remote_data_source.dart'
    as _i741;
import 'package:horizon_mobile/features/home/data/repositories/home_repository_impl.dart'
    as _i366;
import 'package:horizon_mobile/features/home/domain/repositories/home_repository.dart'
    as _i371;
import 'package:horizon_mobile/features/home/presentation/cubit/home_cubit.dart'
    as _i865;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.lazySingleton<_i116.GoogleSignIn>(() => firebaseModule.googleSignIn);
    gh.factory<_i741.HomeRemoteDataSource>(
      () => _i741.HomeFirestoreRemoteDataSource(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i825.AuthRemoteDataSource>(
      () => _i775.AuthApiRemoteDataSource(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.lazySingleton<_i371.HomeRepository>(
      () => _i366.HomeRepositoryImpl(gh<_i741.HomeRemoteDataSource>()),
    );
    gh.factory<_i457.AuthRepository>(
      () => _i52.AuthRepositoryImpl(gh<_i825.AuthRemoteDataSource>()),
    );
    gh.factory<_i865.HomeCubit>(
      () => _i865.HomeCubit(gh<_i371.HomeRepository>()),
    );
    gh.factory<_i262.Login>(() => _i262.Login(gh<_i457.AuthRepository>()));
    gh.factory<_i95.LoginWithGoogle>(
      () => _i95.LoginWithGoogle(gh<_i457.AuthRepository>()),
    );
    gh.factory<_i715.Register>(
      () => _i715.Register(gh<_i457.AuthRepository>()),
    );
    gh.factory<_i650.AuthCubit>(
      () => _i650.AuthCubit(
        gh<_i262.Login>(),
        gh<_i715.Register>(),
        gh<_i95.LoginWithGoogle>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i300.FirebaseModule {}
