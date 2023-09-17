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
  @override
  final BuiltMap<String, String> imageUrlByImageNames;
  @override
  final BuiltMap<String, BuiltList<String>> imageTitlesByImageNames;
  @override
  final BuiltMap<String, BuiltList<String>> englishSentencesByImageNames;

  factory _$LearningItemState(
          [void Function(LearningItemStateBuilder)? updates]) =>
      (new LearningItemStateBuilder()..update(updates))._build();

  _$LearningItemState._(
      {required this.learningItems,
      required this.imageUrlByImageNames,
      required this.imageTitlesByImageNames,
      required this.englishSentencesByImageNames})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        learningItems, r'LearningItemState', 'learningItems');
    BuiltValueNullFieldError.checkNotNull(
        imageUrlByImageNames, r'LearningItemState', 'imageUrlByImageNames');
    BuiltValueNullFieldError.checkNotNull(imageTitlesByImageNames,
        r'LearningItemState', 'imageTitlesByImageNames');
    BuiltValueNullFieldError.checkNotNull(englishSentencesByImageNames,
        r'LearningItemState', 'englishSentencesByImageNames');
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
    return other is LearningItemState &&
        learningItems == other.learningItems &&
        imageUrlByImageNames == other.imageUrlByImageNames &&
        imageTitlesByImageNames == other.imageTitlesByImageNames &&
        englishSentencesByImageNames == other.englishSentencesByImageNames;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, learningItems.hashCode);
    _$hash = $jc(_$hash, imageUrlByImageNames.hashCode);
    _$hash = $jc(_$hash, imageTitlesByImageNames.hashCode);
    _$hash = $jc(_$hash, englishSentencesByImageNames.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LearningItemState')
          ..add('learningItems', learningItems)
          ..add('imageUrlByImageNames', imageUrlByImageNames)
          ..add('imageTitlesByImageNames', imageTitlesByImageNames)
          ..add('englishSentencesByImageNames', englishSentencesByImageNames))
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

  MapBuilder<String, String>? _imageUrlByImageNames;
  MapBuilder<String, String> get imageUrlByImageNames =>
      _$this._imageUrlByImageNames ??= new MapBuilder<String, String>();
  set imageUrlByImageNames(MapBuilder<String, String>? imageUrlByImageNames) =>
      _$this._imageUrlByImageNames = imageUrlByImageNames;

  MapBuilder<String, BuiltList<String>>? _imageTitlesByImageNames;
  MapBuilder<String, BuiltList<String>> get imageTitlesByImageNames =>
      _$this._imageTitlesByImageNames ??=
          new MapBuilder<String, BuiltList<String>>();
  set imageTitlesByImageNames(
          MapBuilder<String, BuiltList<String>>? imageTitlesByImageNames) =>
      _$this._imageTitlesByImageNames = imageTitlesByImageNames;

  MapBuilder<String, BuiltList<String>>? _englishSentencesByImageNames;
  MapBuilder<String, BuiltList<String>> get englishSentencesByImageNames =>
      _$this._englishSentencesByImageNames ??=
          new MapBuilder<String, BuiltList<String>>();
  set englishSentencesByImageNames(
          MapBuilder<String, BuiltList<String>>?
              englishSentencesByImageNames) =>
      _$this._englishSentencesByImageNames = englishSentencesByImageNames;

  LearningItemStateBuilder() {
    LearningItemState._init(this);
  }

  LearningItemStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _learningItems = $v.learningItems.toBuilder();
      _imageUrlByImageNames = $v.imageUrlByImageNames.toBuilder();
      _imageTitlesByImageNames = $v.imageTitlesByImageNames.toBuilder();
      _englishSentencesByImageNames =
          $v.englishSentencesByImageNames.toBuilder();
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
          new _$LearningItemState._(
              learningItems: learningItems.build(),
              imageUrlByImageNames: imageUrlByImageNames.build(),
              imageTitlesByImageNames: imageTitlesByImageNames.build(),
              englishSentencesByImageNames:
                  englishSentencesByImageNames.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'learningItems';
        learningItems.build();
        _$failedField = 'imageUrlByImageNames';
        imageUrlByImageNames.build();
        _$failedField = 'imageTitlesByImageNames';
        imageTitlesByImageNames.build();
        _$failedField = 'englishSentencesByImageNames';
        englishSentencesByImageNames.build();
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
