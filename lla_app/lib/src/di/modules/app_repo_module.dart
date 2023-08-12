import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/repository.dart';

@module
abstract class AppRepositoryModule {
  @singleton
  LLARepository appRepository(Dio dio) {
    return RestLLARepository(
      dio: dio,
    );
  }
}
