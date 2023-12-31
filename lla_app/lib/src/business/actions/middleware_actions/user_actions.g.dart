// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_actions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginAction extends LoginAction {
  @override
  final String email;
  @override
  final String password;
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$LoginAction([void Function(LoginActionBuilder)? updates]) =>
      (new LoginActionBuilder()..update(updates))._build();

  _$LoginAction._(
      {required this.email,
      required this.password,
      this.afterSuccessStatus,
      this.afterErrorStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'LoginAction', 'email');
    BuiltValueNullFieldError.checkNotNull(password, r'LoginAction', 'password');
  }

  @override
  LoginAction rebuild(void Function(LoginActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginActionBuilder toBuilder() => new LoginActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginAction &&
        email == other.email &&
        password == other.password &&
        afterSuccessStatus == other.afterSuccessStatus &&
        afterErrorStatus == other.afterErrorStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, afterSuccessStatus.hashCode);
    _$hash = $jc(_$hash, afterErrorStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginAction')
          ..add('email', email)
          ..add('password', password)
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class LoginActionBuilder
    implements
        Builder<LoginAction, LoginActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$LoginAction? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(covariant String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(covariant String? password) => _$this._password = password;

  StatusBuilder? _afterSuccessStatus;
  StatusBuilder get afterSuccessStatus =>
      _$this._afterSuccessStatus ??= new StatusBuilder();
  set afterSuccessStatus(covariant StatusBuilder? afterSuccessStatus) =>
      _$this._afterSuccessStatus = afterSuccessStatus;

  StatusBuilder? _afterErrorStatus;
  StatusBuilder get afterErrorStatus =>
      _$this._afterErrorStatus ??= new StatusBuilder();
  set afterErrorStatus(covariant StatusBuilder? afterErrorStatus) =>
      _$this._afterErrorStatus = afterErrorStatus;

  LoginActionBuilder();

  LoginActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LoginAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginAction;
  }

  @override
  void update(void Function(LoginActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginAction build() => _build();

  _$LoginAction _build() {
    _$LoginAction _$result;
    try {
      _$result = _$v ??
          new _$LoginAction._(
              email: BuiltValueNullFieldError.checkNotNull(
                  email, r'LoginAction', 'email'),
              password: BuiltValueNullFieldError.checkNotNull(
                  password, r'LoginAction', 'password'),
              afterSuccessStatus: _afterSuccessStatus?.build(),
              afterErrorStatus: _afterErrorStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'afterSuccessStatus';
        _afterSuccessStatus?.build();
        _$failedField = 'afterErrorStatus';
        _afterErrorStatus?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LoginAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$VerifyAccessTokenAction extends VerifyAccessTokenAction {
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$VerifyAccessTokenAction(
          [void Function(VerifyAccessTokenActionBuilder)? updates]) =>
      (new VerifyAccessTokenActionBuilder()..update(updates))._build();

  _$VerifyAccessTokenAction._({this.afterSuccessStatus, this.afterErrorStatus})
      : super._();

  @override
  VerifyAccessTokenAction rebuild(
          void Function(VerifyAccessTokenActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifyAccessTokenActionBuilder toBuilder() =>
      new VerifyAccessTokenActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyAccessTokenAction &&
        afterSuccessStatus == other.afterSuccessStatus &&
        afterErrorStatus == other.afterErrorStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, afterSuccessStatus.hashCode);
    _$hash = $jc(_$hash, afterErrorStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifyAccessTokenAction')
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class VerifyAccessTokenActionBuilder
    implements
        Builder<VerifyAccessTokenAction, VerifyAccessTokenActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$VerifyAccessTokenAction? _$v;

  StatusBuilder? _afterSuccessStatus;
  StatusBuilder get afterSuccessStatus =>
      _$this._afterSuccessStatus ??= new StatusBuilder();
  set afterSuccessStatus(covariant StatusBuilder? afterSuccessStatus) =>
      _$this._afterSuccessStatus = afterSuccessStatus;

  StatusBuilder? _afterErrorStatus;
  StatusBuilder get afterErrorStatus =>
      _$this._afterErrorStatus ??= new StatusBuilder();
  set afterErrorStatus(covariant StatusBuilder? afterErrorStatus) =>
      _$this._afterErrorStatus = afterErrorStatus;

  VerifyAccessTokenActionBuilder();

  VerifyAccessTokenActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant VerifyAccessTokenAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerifyAccessTokenAction;
  }

  @override
  void update(void Function(VerifyAccessTokenActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyAccessTokenAction build() => _build();

  _$VerifyAccessTokenAction _build() {
    _$VerifyAccessTokenAction _$result;
    try {
      _$result = _$v ??
          new _$VerifyAccessTokenAction._(
              afterSuccessStatus: _afterSuccessStatus?.build(),
              afterErrorStatus: _afterErrorStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'afterSuccessStatus';
        _afterSuccessStatus?.build();
        _$failedField = 'afterErrorStatus';
        _afterErrorStatus?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VerifyAccessTokenAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LogoutAction extends LogoutAction {
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$LogoutAction([void Function(LogoutActionBuilder)? updates]) =>
      (new LogoutActionBuilder()..update(updates))._build();

  _$LogoutAction._({this.afterSuccessStatus, this.afterErrorStatus})
      : super._();

  @override
  LogoutAction rebuild(void Function(LogoutActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogoutActionBuilder toBuilder() => new LogoutActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogoutAction &&
        afterSuccessStatus == other.afterSuccessStatus &&
        afterErrorStatus == other.afterErrorStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, afterSuccessStatus.hashCode);
    _$hash = $jc(_$hash, afterErrorStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogoutAction')
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class LogoutActionBuilder
    implements
        Builder<LogoutAction, LogoutActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$LogoutAction? _$v;

  StatusBuilder? _afterSuccessStatus;
  StatusBuilder get afterSuccessStatus =>
      _$this._afterSuccessStatus ??= new StatusBuilder();
  set afterSuccessStatus(covariant StatusBuilder? afterSuccessStatus) =>
      _$this._afterSuccessStatus = afterSuccessStatus;

  StatusBuilder? _afterErrorStatus;
  StatusBuilder get afterErrorStatus =>
      _$this._afterErrorStatus ??= new StatusBuilder();
  set afterErrorStatus(covariant StatusBuilder? afterErrorStatus) =>
      _$this._afterErrorStatus = afterErrorStatus;

  LogoutActionBuilder();

  LogoutActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LogoutAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogoutAction;
  }

  @override
  void update(void Function(LogoutActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogoutAction build() => _build();

  _$LogoutAction _build() {
    _$LogoutAction _$result;
    try {
      _$result = _$v ??
          new _$LogoutAction._(
              afterSuccessStatus: _afterSuccessStatus?.build(),
              afterErrorStatus: _afterErrorStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'afterSuccessStatus';
        _afterSuccessStatus?.build();
        _$failedField = 'afterErrorStatus';
        _afterErrorStatus?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LogoutAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
