import 'package:dio/dio.dart';
import 'package:lla_app/business.dart';
import 'package:redux/redux.dart';

class TokenInterceptors extends Interceptor {
  const TokenInterceptors({
    required this.store,
    required this.onUnauthenticatedError,
  });

  final Store<AppState> store;
  final Function() onUnauthenticatedError;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = store.state.userState.accessToken;
    options
      ..headers.addAll(
        {
          "Authorization": accessToken,
        },
      );

    super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);

    if (err.response?.statusCode == 401) {
      onUnauthenticatedError();
    }

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
