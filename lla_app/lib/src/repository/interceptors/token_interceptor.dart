import 'package:dio/dio.dart';
import 'package:lla_app/business.dart';
import 'package:redux/redux.dart';

class TokenInterceptors extends Interceptor {
  const TokenInterceptors({
    required this.store,
  });

  final Store<AppState> store;


  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) {
    // print(
    //     'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
    return Future.value();
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;
    // final isSuccess = RestMessageHandler.isSuccess(data);
    // if (!isSuccess) throw RestMessageHandler.getErrorMessage(data);
    super.onResponse(response, handler);
  }
}