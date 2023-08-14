// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'li_actions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UploadLIItemAction extends UploadLIItemAction {
  @override
  final LearningItemEntity learningItem;
  @override
  final Status? afterSuccessStatus;
  @override
  final Status? afterErrorStatus;

  factory _$UploadLIItemAction(
          [void Function(UploadLIItemActionBuilder)? updates]) =>
      (new UploadLIItemActionBuilder()..update(updates))._build();

  _$UploadLIItemAction._(
      {required this.learningItem,
      this.afterSuccessStatus,
      this.afterErrorStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        learningItem, r'UploadLIItemAction', 'learningItem');
  }

  @override
  UploadLIItemAction rebuild(
          void Function(UploadLIItemActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadLIItemActionBuilder toBuilder() =>
      new UploadLIItemActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadLIItemAction &&
        learningItem == other.learningItem &&
        afterSuccessStatus == other.afterSuccessStatus &&
        afterErrorStatus == other.afterErrorStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, learningItem.hashCode);
    _$hash = $jc(_$hash, afterSuccessStatus.hashCode);
    _$hash = $jc(_$hash, afterErrorStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UploadLIItemAction')
          ..add('learningItem', learningItem)
          ..add('afterSuccessStatus', afterSuccessStatus)
          ..add('afterErrorStatus', afterErrorStatus))
        .toString();
  }
}

class UploadLIItemActionBuilder
    implements
        Builder<UploadLIItemAction, UploadLIItemActionBuilder>,
        MiddlewareWithStatusActionBuilder<AppState> {
  _$UploadLIItemAction? _$v;

  LearningItemEntityBuilder? _learningItem;
  LearningItemEntityBuilder get learningItem =>
      _$this._learningItem ??= new LearningItemEntityBuilder();
  set learningItem(covariant LearningItemEntityBuilder? learningItem) =>
      _$this._learningItem = learningItem;

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

  UploadLIItemActionBuilder();

  UploadLIItemActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _learningItem = $v.learningItem.toBuilder();
      _afterSuccessStatus = $v.afterSuccessStatus?.toBuilder();
      _afterErrorStatus = $v.afterErrorStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UploadLIItemAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UploadLIItemAction;
  }

  @override
  void update(void Function(UploadLIItemActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadLIItemAction build() => _build();

  _$UploadLIItemAction _build() {
    _$UploadLIItemAction _$result;
    try {
      _$result = _$v ??
          new _$UploadLIItemAction._(
              learningItem: learningItem.build(),
              afterSuccessStatus: _afterSuccessStatus?.build(),
              afterErrorStatus: _afterErrorStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'learningItem';
        learningItem.build();
        _$failedField = 'afterSuccessStatus';
        _afterSuccessStatus?.build();
        _$failedField = 'afterErrorStatus';
        _afterErrorStatus?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UploadLIItemAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
