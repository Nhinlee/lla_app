// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_item_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LearningItemEntity extends LearningItemEntity {
  @override
  final String id;
  @override
  final String imageLink;
  @override
  final String englishWord;
  @override
  final String vietnameseWord;
  @override
  final BuiltList<String> englishSentences;

  factory _$LearningItemEntity(
          [void Function(LearningItemEntityBuilder)? updates]) =>
      (new LearningItemEntityBuilder()..update(updates))._build();

  _$LearningItemEntity._(
      {required this.id,
      required this.imageLink,
      required this.englishWord,
      required this.vietnameseWord,
      required this.englishSentences})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'LearningItemEntity', 'id');
    BuiltValueNullFieldError.checkNotNull(
        imageLink, r'LearningItemEntity', 'imageLink');
    BuiltValueNullFieldError.checkNotNull(
        englishWord, r'LearningItemEntity', 'englishWord');
    BuiltValueNullFieldError.checkNotNull(
        vietnameseWord, r'LearningItemEntity', 'vietnameseWord');
    BuiltValueNullFieldError.checkNotNull(
        englishSentences, r'LearningItemEntity', 'englishSentences');
  }

  @override
  LearningItemEntity rebuild(
          void Function(LearningItemEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LearningItemEntityBuilder toBuilder() =>
      new LearningItemEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LearningItemEntity &&
        id == other.id &&
        imageLink == other.imageLink &&
        englishWord == other.englishWord &&
        vietnameseWord == other.vietnameseWord &&
        englishSentences == other.englishSentences;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, imageLink.hashCode);
    _$hash = $jc(_$hash, englishWord.hashCode);
    _$hash = $jc(_$hash, vietnameseWord.hashCode);
    _$hash = $jc(_$hash, englishSentences.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LearningItemEntity')
          ..add('id', id)
          ..add('imageLink', imageLink)
          ..add('englishWord', englishWord)
          ..add('vietnameseWord', vietnameseWord)
          ..add('englishSentences', englishSentences))
        .toString();
  }
}

class LearningItemEntityBuilder
    implements Builder<LearningItemEntity, LearningItemEntityBuilder> {
  _$LearningItemEntity? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _imageLink;
  String? get imageLink => _$this._imageLink;
  set imageLink(String? imageLink) => _$this._imageLink = imageLink;

  String? _englishWord;
  String? get englishWord => _$this._englishWord;
  set englishWord(String? englishWord) => _$this._englishWord = englishWord;

  String? _vietnameseWord;
  String? get vietnameseWord => _$this._vietnameseWord;
  set vietnameseWord(String? vietnameseWord) =>
      _$this._vietnameseWord = vietnameseWord;

  ListBuilder<String>? _englishSentences;
  ListBuilder<String> get englishSentences =>
      _$this._englishSentences ??= new ListBuilder<String>();
  set englishSentences(ListBuilder<String>? englishSentences) =>
      _$this._englishSentences = englishSentences;

  LearningItemEntityBuilder() {
    LearningItemEntity._initializeBuilder(this);
  }

  LearningItemEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _imageLink = $v.imageLink;
      _englishWord = $v.englishWord;
      _vietnameseWord = $v.vietnameseWord;
      _englishSentences = $v.englishSentences.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LearningItemEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LearningItemEntity;
  }

  @override
  void update(void Function(LearningItemEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LearningItemEntity build() => _build();

  _$LearningItemEntity _build() {
    _$LearningItemEntity _$result;
    try {
      _$result = _$v ??
          new _$LearningItemEntity._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'LearningItemEntity', 'id'),
              imageLink: BuiltValueNullFieldError.checkNotNull(
                  imageLink, r'LearningItemEntity', 'imageLink'),
              englishWord: BuiltValueNullFieldError.checkNotNull(
                  englishWord, r'LearningItemEntity', 'englishWord'),
              vietnameseWord: BuiltValueNullFieldError.checkNotNull(
                  vietnameseWord, r'LearningItemEntity', 'vietnameseWord'),
              englishSentences: englishSentences.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'englishSentences';
        englishSentences.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LearningItemEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
