// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filestore_url.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FileStoreURL> _$fileStoreURLSerializer =
    new _$FileStoreURLSerializer();

class _$FileStoreURLSerializer implements StructuredSerializer<FileStoreURL> {
  @override
  final Iterable<Type> types = const [FileStoreURL, _$FileStoreURL];
  @override
  final String wireName = 'FileStoreURL';

  @override
  Iterable<Object?> serialize(Serializers serializers, FileStoreURL object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'presigned_url',
      serializers.serialize(object.resumableUploadUrl,
          specifiedType: const FullType(String)),
      'public_url',
      serializers.serialize(object.publicUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  FileStoreURL deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FileStoreURLBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'presigned_url':
          result.resumableUploadUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'public_url':
          result.publicUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FileStoreURL extends FileStoreURL {
  @override
  final String resumableUploadUrl;
  @override
  final String publicUrl;

  factory _$FileStoreURL([void Function(FileStoreURLBuilder)? updates]) =>
      (new FileStoreURLBuilder()..update(updates))._build();

  _$FileStoreURL._({required this.resumableUploadUrl, required this.publicUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        resumableUploadUrl, r'FileStoreURL', 'resumableUploadUrl');
    BuiltValueNullFieldError.checkNotNull(
        publicUrl, r'FileStoreURL', 'publicUrl');
  }

  @override
  FileStoreURL rebuild(void Function(FileStoreURLBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FileStoreURLBuilder toBuilder() => new FileStoreURLBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FileStoreURL &&
        resumableUploadUrl == other.resumableUploadUrl &&
        publicUrl == other.publicUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, resumableUploadUrl.hashCode);
    _$hash = $jc(_$hash, publicUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FileStoreURL')
          ..add('resumableUploadUrl', resumableUploadUrl)
          ..add('publicUrl', publicUrl))
        .toString();
  }
}

class FileStoreURLBuilder
    implements Builder<FileStoreURL, FileStoreURLBuilder> {
  _$FileStoreURL? _$v;

  String? _resumableUploadUrl;
  String? get resumableUploadUrl => _$this._resumableUploadUrl;
  set resumableUploadUrl(String? resumableUploadUrl) =>
      _$this._resumableUploadUrl = resumableUploadUrl;

  String? _publicUrl;
  String? get publicUrl => _$this._publicUrl;
  set publicUrl(String? publicUrl) => _$this._publicUrl = publicUrl;

  FileStoreURLBuilder() {
    FileStoreURL._initializeBuilder(this);
  }

  FileStoreURLBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _resumableUploadUrl = $v.resumableUploadUrl;
      _publicUrl = $v.publicUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FileStoreURL other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FileStoreURL;
  }

  @override
  void update(void Function(FileStoreURLBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FileStoreURL build() => _build();

  _$FileStoreURL _build() {
    final _$result = _$v ??
        new _$FileStoreURL._(
            resumableUploadUrl: BuiltValueNullFieldError.checkNotNull(
                resumableUploadUrl, r'FileStoreURL', 'resumableUploadUrl'),
            publicUrl: BuiltValueNullFieldError.checkNotNull(
                publicUrl, r'FileStoreURL', 'publicUrl'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
