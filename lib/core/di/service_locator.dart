import 'package:get_it/get_it.dart';
import 'package:horizon_mobile/core/di/service_locator.config.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => getIt.init();
