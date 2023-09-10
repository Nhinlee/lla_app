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

    yield store.state.rebuild((p0) {
      return p0.userState..accessToken = accessToken;
    });
  }

  LoginAction._();
  factory LoginAction([void Function(LoginActionBuilder) updates]) =
      _$LoginAction;
}
