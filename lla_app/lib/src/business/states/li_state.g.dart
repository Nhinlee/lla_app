// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'li_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class AbstractLIFeatureBuilder implements StatusStateBuilder {
  void replace(covariant AbstractLIFeature other);
  void update(void Function(AbstractLIFeatureBuilder) updates);
  LearningItemStateBuilder get liState;
  set liState(covariant LearningItemStateBuilder? liState);

  MapBuilder<String, Status> get statuses;
  set statuses(covariant MapBuilder<String, Status>? statuses);
}

class _$LearningItemState extends LearningItemState {
  @override
  final BuiltMap<String, LearningItemEntity> learningItems;

  factory _$LearningItemState(
          [void Function(LearningItemStateBuilder)? updates]) =>
      (new LearningItemStateBuilder()..update(updates))._build();

  _$LearningItemState._({required this.learningItems}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        learningItems, r'LearningItemState', 'learningItems');
  }

  @override
  LearningItemState rebuild(void Function(LearningItemStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LearningItemStateBuilder toBuilder() =>
      new LearningItemStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LearningItemState && learningItems == other.learningItems;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, learningItems.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LearningItemState')
          ..add('learningItems', learningItems))
        .toString();
  }
}

class LearningItemStateBuilder
    implements Builder<LearningItemState, LearningItemStateBuilder> {
  _$LearningItemState? _$v;

  MapBuilder<String, LearningItemEntity>? _learningItems;
  MapBuilder<String, LearningItemEntity> get learningItems =>
      _$this._learningItems ??= new MapBuilder<String, LearningItemEntity>();
  set learningItems(MapBuilder<String, LearningItemEntity>? learningItems) =>
      _$this._learningItems = learningItems;

  LearningItemStateBuilder() {
    LearningItemState._init(this);
  }

  LearningItemStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _learningItems = $v.learningItems.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LearningItemState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LearningItemState;
  }

  @override
  void update(void Function(LearningItemStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LearningItemState build() => _build();

  _$LearningItemState _build() {
    _$LearningItemState _$result;
    try {
      _$result = _$v ??
          new _$LearningItemState._(learningItems: learningItems.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'learningItems';
        learningItems.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LearningItemState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
