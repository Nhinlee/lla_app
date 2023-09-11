import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lla_app/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @singleton
  Future<SharedPreferences> sharedPreferences() async {
    return await SharedPreferences.getInstance();
  }
}
