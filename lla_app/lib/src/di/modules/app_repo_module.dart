import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppRepositoryModule {
  @singleton
  AbstractRepository appRepository(
    Dio dio,
    SharedPreferences sharedPreferences,
  ) {
    return LLARepository(
      restRepo: RestLLARepository(
        dio: dio,
      ),
      localRepo: LocalRepository(
        sharedRef: sharedPreferences,
      ),
    );
  }
}
