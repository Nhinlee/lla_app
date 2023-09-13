// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserEntity extends UserEntity {
  @override
  final int id;
  @override
  final String email;
  @override
  final String name;

  factory _$UserEntity([void Function(UserEntityBuilder)? updates]) =>
      (new UserEntityBuilder()..update(updates))._build();

  _$UserEntity._({required this.id, required this.email, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UserEntity', 'id');
    BuiltValueNullFieldError.checkNotNull(email, r'UserEntity', 'email');
    BuiltValueNullFieldError.checkNotNull(name, r'UserEntity', 'name');
  }

  @override
  UserEntity rebuild(void Function(UserEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserEntityBuilder toBuilder() => new UserEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserEntity &&
        id == other.id &&
        email == other.email &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserEntity')
          ..add('id', id)
          ..add('email', email)
          ..add('name', name))
        .toString();
  }
}

class UserEntityBuilder implements Builder<UserEntity, UserEntityBuilder> {
  _$UserEntity? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  UserEntityBuilder() {
    UserEntity._init(this);
  }

  UserEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserEntity;
  }

  @override
  void update(void Function(UserEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserEntity build() => _build();

  _$UserEntity _build() {
    final _$result = _$v ??
        new _$UserEntity._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'UserEntity', 'id'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'UserEntity', 'email'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'UserEntity', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
