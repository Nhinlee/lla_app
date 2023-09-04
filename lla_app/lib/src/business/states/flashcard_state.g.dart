// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class AbstractFlashcardFeatureBuilder implements StatusStateBuilder {
  void replace(covariant AbstractFlashcardFeature other);
  void update(void Function(AbstractFlashcardFeatureBuilder) updates);
  FlashcardStateBuilder get flashcardState;
  set flashcardState(covariant FlashcardStateBuilder? flashcardState);

  MapBuilder<String, Status> get statuses;
  set statuses(covariant MapBuilder<String, Status>? statuses);
}

class _$FlashcardState extends FlashcardState {
  @override
  final BuiltMap<String, BuiltMap<String, FlashcardEntity>> flashcards;
  @override
  final BuiltMap<String, BuiltList<String>> completedFlashcards;

  factory _$FlashcardState([void Function(FlashcardStateBuilder)? updates]) =>
      (new FlashcardStateBuilder()..update(updates))._build();

  _$FlashcardState._(
      {required this.flashcards, required this.completedFlashcards})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        flashcards, r'FlashcardState', 'flashcards');
    BuiltValueNullFieldError.checkNotNull(
        completedFlashcards, r'FlashcardState', 'completedFlashcards');
  }

  @override
  FlashcardState rebuild(void Function(FlashcardStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FlashcardStateBuilder toBuilder() =>
      new FlashcardStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FlashcardState &&
        flashcards == other.flashcards &&
        completedFlashcards == other.completedFlashcards;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, flashcards.hashCode);
    _$hash = $jc(_$hash, completedFlashcards.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FlashcardState')
          ..add('flashcards', flashcards)
          ..add('completedFlashcards', completedFlashcards))
        .toString();
  }
}

class FlashcardStateBuilder
    implements Builder<FlashcardState, FlashcardStateBuilder> {
  _$FlashcardState? _$v;

  MapBuilder<String, BuiltMap<String, FlashcardEntity>>? _flashcards;
  MapBuilder<String, BuiltMap<String, FlashcardEntity>> get flashcards =>
      _$this._flashcards ??=
          new MapBuilder<String, BuiltMap<String, FlashcardEntity>>();
  set flashcards(
          MapBuilder<String, BuiltMap<String, FlashcardEntity>>? flashcards) =>
      _$this._flashcards = flashcards;

  MapBuilder<String, BuiltList<String>>? _completedFlashcards;
  MapBuilder<String, BuiltList<String>> get completedFlashcards =>
      _$this._completedFlashcards ??=
          new MapBuilder<String, BuiltList<String>>();
  set completedFlashcards(
          MapBuilder<String, BuiltList<String>>? completedFlashcards) =>
      _$this._completedFlashcards = completedFlashcards;

  FlashcardStateBuilder();

  FlashcardStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _flashcards = $v.flashcards.toBuilder();
      _completedFlashcards = $v.completedFlashcards.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FlashcardState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FlashcardState;
  }

  @override
  void update(void Function(FlashcardStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FlashcardState build() => _build();

  _$FlashcardState _build() {
    _$FlashcardState _$result;
    try {
      _$result = _$v ??
          new _$FlashcardState._(
              flashcards: flashcards.build(),
              completedFlashcards: completedFlashcards.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'flashcards';
        flashcards.build();
        _$failedField = 'completedFlashcards';
        completedFlashcards.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FlashcardState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
