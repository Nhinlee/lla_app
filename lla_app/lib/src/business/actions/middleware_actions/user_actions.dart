import 'package:built_value/built_value.dart';
import 'package:lla_app/business.dart';
import 'package:redux/redux.dart';
import 'package:redux_simple/redux_simple.dart';

part 'user_actions.g.dart';

abstract class LoginAction extends Object
    with GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<LoginAction, LoginActionBuilder> {
  String get email;

  String get password;

  factory LoginAction.from({
    required String email,
    required String password,
  }) {
    return LoginAction(
      (updates) => updates
        ..email = email
        ..password = password,
    );
  }

  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    final accessToken = await AppRepo.repo.login(
      email: email,
      password: password,
    );

    await AppRepo.repo.setAccessToken(accessToken);

    yield store.state.rebuild((p0) {
      return p0.userState..accessToken = accessToken;
    });
  }

  LoginAction._();
  factory LoginAction([void Function(LoginActionBuilder) updates]) =
      _$LoginAction;
}

abstract class VerifyAccessTokenAction extends Object
    with GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<VerifyAccessTokenAction, VerifyAccessTokenActionBuilder> {
  VerifyAccessTokenAction._();

  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    final accessToken = AppRepo.repo.getAccessToken();

    yield store.state.rebuild(
      (updates) => updates..userState.accessToken = accessToken,
    );

    final isValid = await AppRepo.repo.verifyAccessToken(
      accessToken: accessToken,
    );
  }

  factory VerifyAccessTokenAction(
          [void Function(VerifyAccessTokenActionBuilder) updates]) =
      _$VerifyAccessTokenAction;
}

abstract class LogoutAction
    with GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<LogoutAction, LogoutActionBuilder> {
  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    yield store.state.rebuild(
      (updates) => updates..userState.accessToken = '',
    );
  }

  LogoutAction._();
  factory LogoutAction([void Function(LogoutActionBuilder) updates]) =
      _$LogoutAction;
}
