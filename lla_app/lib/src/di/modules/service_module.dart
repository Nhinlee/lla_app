import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lla_app/repository.dart';

@module
abstract class ServiceModule {
  @singleton
  Dio appRepository() {
    return Dio(
      BaseOptions(
        baseUrl: RestApis.baseUrl,
      ),
    );
  }
}
