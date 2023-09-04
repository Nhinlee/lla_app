// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_actions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SaveCompletedFlashcardAction extends SaveCompletedFlashcardAction {
  @override
  final String topicId;
  @override
  final BuiltList<String> completedFlashcards;

  factory _$SaveCompletedFlashcardAction(
          [void Function(SaveCompletedFlashcardActionBuilder)? updates]) =>
      (new SaveCompletedFlashcardActionBuilder()..update(updates))._build();

  _$SaveCompletedFlashcardAction._(
      {required this.topicId, required this.completedFlashcards})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        topicId, r'SaveCompletedFlashcardAction', 'topicId');
    BuiltValueNullFieldError.checkNotNull(completedFlashcards,
        r'SaveCompletedFlashcardAction', 'completedFlashcards');
  }

  @override
  SaveCompletedFlashcardAction rebuild(
          void Function(SaveCompletedFlashcardActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveCompletedFlashcardActionBuilder toBuilder() =>
      new SaveCompletedFlashcardActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveCompletedFlashcardAction &&
        topicId == other.topicId &&
        completedFlashcards == other.completedFlashcards;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, topicId.hashCode);
    _$hash = $jc(_$hash, completedFlashcards.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SaveCompletedFlashcardAction')
          ..add('topicId', topicId)
          ..add('completedFlashcards', completedFlashcards))
        .toString();
  }
}

class SaveCompletedFlashcardActionBuilder
    implements
        Builder<SaveCompletedFlashcardAction,
            SaveCompletedFlashcardActionBuilder>,
        ReducerActionBuilder<AppState> {
  _$SaveCompletedFlashcardAction? _$v;

  String? _topicId;
  String? get topicId => _$this._topicId;
  set topicId(covariant String? topicId) => _$this._topicId = topicId;

  ListBuilder<String>? _completedFlashcards;
  ListBuilder<String> get completedFlashcards =>
      _$this._completedFlashcards ??= new ListBuilder<String>();
  set completedFlashcards(covariant ListBuilder<String>? completedFlashcards) =>
      _$this._completedFlashcards = completedFlashcards;

  SaveCompletedFlashcardActionBuilder();

  SaveCompletedFlashcardActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _topicId = $v.topicId;
      _completedFlashcards = $v.completedFlashcards.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SaveCompletedFlashcardAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SaveCompletedFlashcardAction;
  }

  @override
  void update(void Function(SaveCompletedFlashcardActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SaveCompletedFlashcardAction build() => _build();

  _$SaveCompletedFlashcardAction _build() {
    _$SaveCompletedFlashcardAction _$result;
    try {
      _$result = _$v ??
          new _$SaveCompletedFlashcardAction._(
              topicId: BuiltValueNullFieldError.checkNotNull(
                  topicId, r'SaveCompletedFlashcardAction', 'topicId'),
              completedFlashcards: completedFlashcards.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'completedFlashcards';
        completedFlashcards.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SaveCompletedFlashcardAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
