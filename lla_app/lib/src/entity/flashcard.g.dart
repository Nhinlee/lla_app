// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FlashcardEntity> _$flashcardEntitySerializer =
    new _$FlashcardEntitySerializer();

class _$FlashcardEntitySerializer
    implements StructuredSerializer<FlashcardEntity> {
  @override
  final Iterable<Type> types = const [FlashcardEntity, _$FlashcardEntity];
  @override
  final String wireName = 'FlashcardEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, FlashcardEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'image_link',
      serializers.serialize(object.imageLink,
          specifiedType: const FullType(String)),
      'english_word',
      serializers.serialize(object.englishWord,
          specifiedType: const FullType(String)),
      'english_sentences',
      serializers.serialize(object.englishSentences,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  FlashcardEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FlashcardEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image_link':
          result.imageLink = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'english_word':
          result.englishWord = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'english_sentences':
          result.englishSentences.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$FlashcardEntity extends FlashcardEntity {
  @override
  final String id;
  @override
  final String imageLink;
  @override
  final String englishWord;
  @override
  final BuiltList<String> englishSentences;
  @override
  final DateTime createdAt;
  @override
  final DateTime completedAt;

  factory _$FlashcardEntity([void Function(FlashcardEntityBuilder)? updates]) =>
      (new FlashcardEntityBuilder()..update(updates))._build();

  _$FlashcardEntity._(
      {required this.id,
      required this.imageLink,
      required this.englishWord,
      required this.englishSentences,
      required this.createdAt,
      required this.completedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'FlashcardEntity', 'id');
    BuiltValueNullFieldError.checkNotNull(
        imageLink, r'FlashcardEntity', 'imageLink');
    BuiltValueNullFieldError.checkNotNull(
        englishWord, r'FlashcardEntity', 'englishWord');
    BuiltValueNullFieldError.checkNotNull(
        englishSentences, r'FlashcardEntity', 'englishSentences');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'FlashcardEntity', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        completedAt, r'FlashcardEntity', 'completedAt');
  }

  @override
  FlashcardEntity rebuild(void Function(FlashcardEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FlashcardEntityBuilder toBuilder() =>
      new FlashcardEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FlashcardEntity &&
        id == other.id &&
        imageLink == other.imageLink &&
        englishWord == other.englishWord &&
        englishSentences == other.englishSentences &&
        createdAt == other.createdAt &&
        completedAt == other.completedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, imageLink.hashCode);
    _$hash = $jc(_$hash, englishWord.hashCode);
    _$hash = $jc(_$hash, englishSentences.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, completedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FlashcardEntity')
          ..add('id', id)
          ..add('imageLink', imageLink)
          ..add('englishWord', englishWord)
          ..add('englishSentences', englishSentences)
          ..add('createdAt', createdAt)
          ..add('completedAt', completedAt))
        .toString();
  }
}

class FlashcardEntityBuilder
    implements Builder<FlashcardEntity, FlashcardEntityBuilder> {
  _$FlashcardEntity? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _imageLink;
  String? get imageLink => _$this._imageLink;
  set imageLink(String? imageLink) => _$this._imageLink = imageLink;

  String? _englishWord;
  String? get englishWord => _$this._englishWord;
  set englishWord(String? englishWord) => _$this._englishWord = englishWord;

  ListBuilder<String>? _englishSentences;
  ListBuilder<String> get englishSentences =>
      _$this._englishSentences ??= new ListBuilder<String>();
  set englishSentences(ListBuilder<String>? englishSentences) =>
      _$this._englishSentences = englishSentences;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _completedAt;
  DateTime? get completedAt => _$this._completedAt;
  set completedAt(DateTime? completedAt) => _$this._completedAt = completedAt;

  FlashcardEntityBuilder() {
    FlashcardEntity._initializeBuilder(this);
  }

  FlashcardEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _imageLink = $v.imageLink;
      _englishWord = $v.englishWord;
      _englishSentences = $v.englishSentences.toBuilder();
      _createdAt = $v.createdAt;
      _completedAt = $v.completedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FlashcardEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FlashcardEntity;
  }

  @override
  void update(void Function(FlashcardEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FlashcardEntity build() => _build();

  _$FlashcardEntity _build() {
    _$FlashcardEntity _$result;
    try {
      _$result = _$v ??
          new _$FlashcardEntity._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'FlashcardEntity', 'id'),
              imageLink: BuiltValueNullFieldError.checkNotNull(
                  imageLink, r'FlashcardEntity', 'imageLink'),
              englishWord: BuiltValueNullFieldError.checkNotNull(
                  englishWord, r'FlashcardEntity', 'englishWord'),
              englishSentences: englishSentences.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'FlashcardEntity', 'createdAt'),
              completedAt: BuiltValueNullFieldError.checkNotNull(
                  completedAt, r'FlashcardEntity', 'completedAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'englishSentences';
        englishSentences.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FlashcardEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
