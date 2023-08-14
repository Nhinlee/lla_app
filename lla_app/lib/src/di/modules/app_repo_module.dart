import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/repository.dart';

@module
abstract class AppRepositoryModule {
  @singleton
  AbstractRepository appRepository(
    Dio dio,
  ) {
    return LLARepository(
      restRepo: RestLLARepository(
        dio: dio,
      ),
    );
  }
}
