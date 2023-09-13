import 'package:built_value/built_value.dart';

part 'user.g.dart';

abstract class UserEntity implements Built<UserEntity, UserEntityBuilder> {
  int get id;

  String get email;

  String get name;

  @BuiltValueHook(initializeBuilder: true)
  static void _init(UserEntityBuilder builder) => builder
    ..id = 0
    ..name = ""
    ..email = "";

  UserEntity._();
  factory UserEntity([void Function(UserEntityBuilder) updates]) = _$UserEntity;
}
