// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_actions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetFlashcardsAction extends GetFlashcardsAction {
  @override
  final String topicId;
  @override
  final int limit;
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$GetFlashcardsAction(
          [void Function(GetFlashcardsActionBuilder)? updates]) =>
      (new GetFlashcardsActionBuilder()..update(updates))._build();

  _$GetFlashcardsAction._(
      {required this.topicId,
      required this.limit,
      this.afterSuccessStatus,
      this.afterErrorStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        topicId, r'GetFlashcardsAction', 'topicId');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GetFlashcardsAction', 'limit');
  }

  @override
  GetFlashcardsAction rebuild(
          void Function(GetFlashcardsActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetFlashcardsActionBuilder toBuilder() =>
      new GetFlashcardsActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetFlashcardsAction &&
        topicId == other.topicId &&
        limit == other.limit &&
        afterSuccessStatus == other.afterSuccessStatus &&
        afterErrorStatus == other.afterErrorStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, topicId.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, afterSuccessStatus.hashCode);
    _$hash = $jc(_$hash, afterErrorStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetFlashcardsAction')
          ..add('topicId', topicId)
          ..add('limit', limit)
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class GetFlashcardsActionBuilder
    implements
        Builder<GetFlashcardsAction, GetFlashcardsActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$GetFlashcardsAction? _$v;

  String? _topicId;
  String? get topicId => _$this._topicId;
  set topicId(covariant String? topicId) => _$this._topicId = topicId;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(covariant int? limit) => _$this._limit = limit;

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

  GetFlashcardsActionBuilder();

  GetFlashcardsActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _topicId = $v.topicId;
      _limit = $v.limit;
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GetFlashcardsAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetFlashcardsAction;
  }

  @override
  void update(void Function(GetFlashcardsActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetFlashcardsAction build() => _build();

  _$GetFlashcardsAction _build() {
    _$GetFlashcardsAction _$result;
    try {
      _$result = _$v ??
          new _$GetFlashcardsAction._(
              topicId: BuiltValueNullFieldError.checkNotNull(
                  topicId, r'GetFlashcardsAction', 'topicId'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GetFlashcardsAction', 'limit'),
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
            r'GetFlashcardsAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
