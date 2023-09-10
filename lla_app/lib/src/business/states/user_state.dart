import 'package:built_value/built_value.dart';
import 'package:redux_simple/redux_simple.dart';

part 'user_state.g.dart';

@BuiltValue(instantiable: false)
abstract class AbstractUserFeature implements StatusState {
  UserState get userState;
}

abstract class UserState implements Built<UserState, UserStateBuilder> {
  String? get accessToken;

  UserState._();
  factory UserState([void Function(UserStateBuilder) updates]) = _$UserState;
}
