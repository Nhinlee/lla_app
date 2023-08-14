// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lla_app/business.dart' as _i5;
import 'package:lla_app/src/di/app_injector.dart' as _i3;

import 'modules/app_repo_module.dart' as _i7;
import 'modules/service_module.dart' as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final serviceModule = _$ServiceModule();
  final appRepositoryModule = _$AppRepositoryModule();
  gh.singleton<_i3.AppInjector>(_i3.AppInjector());
  gh.singleton<_i4.Dio>(serviceModule.appRepository());
  gh.singleton<_i5.AbstractRepository>(
      appRepositoryModule.appRepository(gh<_i4.Dio>()));
  return getIt;
}

class _$ServiceModule extends _i6.ServiceModule {}

class _$AppRepositoryModule extends _i7.AppRepositoryModule {}
