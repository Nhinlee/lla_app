// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class AbstractUserFeatureBuilder implements StatusStateBuilder {
  void replace(covariant AbstractUserFeature other);
  void update(void Function(AbstractUserFeatureBuilder) updates);
  UserStateBuilder get userState;
  set userState(covariant UserStateBuilder? userState);

  MapBuilder<String, Status> get statuses;
  set statuses(covariant MapBuilder<String, Status>? statuses);
}

class _$UserState extends UserState {
  @override
  final String? accessToken;

  factory _$UserState([void Function(UserStateBuilder)? updates]) =>
      (new UserStateBuilder()..update(updates))._build();

  _$UserState._({this.accessToken}) : super._();

  @override
  UserState rebuild(void Function(UserStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStateBuilder toBuilder() => new UserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserState && accessToken == other.accessToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserState')
          ..add('accessToken', accessToken))
        .toString();
  }
}

class UserStateBuilder implements Builder<UserState, UserStateBuilder> {
  _$UserState? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  UserStateBuilder();

  UserStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserState;
  }

  @override
  void update(void Function(UserStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserState build() => _build();

  _$UserState _build() {
    final _$result = _$v ?? new _$UserState._(accessToken: accessToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
