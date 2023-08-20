// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_actions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetAllTopicsAction extends GetAllTopicsAction {
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$GetAllTopicsAction(
          [void Function(GetAllTopicsActionBuilder)? updates]) =>
      (new GetAllTopicsActionBuilder()..update(updates))._build();

  _$GetAllTopicsAction._({this.afterSuccessStatus, this.afterErrorStatus})
      : super._();

  @override
  GetAllTopicsAction rebuild(
          void Function(GetAllTopicsActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAllTopicsActionBuilder toBuilder() =>
      new GetAllTopicsActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAllTopicsAction &&
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
    return (newBuiltValueToStringHelper(r'GetAllTopicsAction')
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class GetAllTopicsActionBuilder
    implements
        Builder<GetAllTopicsAction, GetAllTopicsActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$GetAllTopicsAction? _$v;

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

  GetAllTopicsActionBuilder();

  GetAllTopicsActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GetAllTopicsAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAllTopicsAction;
  }

  @override
  void update(void Function(GetAllTopicsActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAllTopicsAction build() => _build();

  _$GetAllTopicsAction _build() {
    _$GetAllTopicsAction _$result;
    try {
      _$result = _$v ??
          new _$GetAllTopicsAction._(
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
            r'GetAllTopicsAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CountTotalLIByTopicIdsAction extends CountTotalLIByTopicIdsAction {
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$CountTotalLIByTopicIdsAction(
          [void Function(CountTotalLIByTopicIdsActionBuilder)? updates]) =>
      (new CountTotalLIByTopicIdsActionBuilder()..update(updates))._build();

  _$CountTotalLIByTopicIdsAction._(
      {this.afterSuccessStatus, this.afterErrorStatus})
      : super._();

  @override
  CountTotalLIByTopicIdsAction rebuild(
          void Function(CountTotalLIByTopicIdsActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountTotalLIByTopicIdsActionBuilder toBuilder() =>
      new CountTotalLIByTopicIdsActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CountTotalLIByTopicIdsAction &&
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
    return (newBuiltValueToStringHelper(r'CountTotalLIByTopicIdsAction')
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class CountTotalLIByTopicIdsActionBuilder
    implements
        Builder<CountTotalLIByTopicIdsAction,
            CountTotalLIByTopicIdsActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$CountTotalLIByTopicIdsAction? _$v;

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

  CountTotalLIByTopicIdsActionBuilder();

  CountTotalLIByTopicIdsActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CountTotalLIByTopicIdsAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CountTotalLIByTopicIdsAction;
  }

  @override
  void update(void Function(CountTotalLIByTopicIdsActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CountTotalLIByTopicIdsAction build() => _build();

  _$CountTotalLIByTopicIdsAction _build() {
    _$CountTotalLIByTopicIdsAction _$result;
    try {
      _$result = _$v ??
          new _$CountTotalLIByTopicIdsAction._(
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
            r'CountTotalLIByTopicIdsAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
