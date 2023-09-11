import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lla_app/business.dart';

import 'app_injector.config.dart' as i;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => i.init(getIt);

@singleton
class AppInjector {
  Dio get dio => getIt.get<Dio>();

  Future<AbstractRepository> get appRepository =>
      getIt.getAsync<AbstractRepository>();
}

AppInjector getAppInjector() {
  return getIt.get<AppInjector>();
}
