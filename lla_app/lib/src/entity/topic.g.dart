// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TopicEntity> _$topicEntitySerializer = new _$TopicEntitySerializer();

class _$TopicEntitySerializer implements StructuredSerializer<TopicEntity> {
  @override
  final Iterable<Type> types = const [TopicEntity, _$TopicEntity];
  @override
  final String wireName = 'TopicEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, TopicEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TopicEntity deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TopicEntityBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TopicEntity extends TopicEntity {
  @override
  final String id;
  @override
  final String name;

  factory _$TopicEntity([void Function(TopicEntityBuilder)? updates]) =>
      (new TopicEntityBuilder()..update(updates))._build();

  _$TopicEntity._({required this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'TopicEntity', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'TopicEntity', 'name');
  }

  @override
  TopicEntity rebuild(void Function(TopicEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopicEntityBuilder toBuilder() => new TopicEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopicEntity && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TopicEntity')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class TopicEntityBuilder implements Builder<TopicEntity, TopicEntityBuilder> {
  _$TopicEntity? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  TopicEntityBuilder();

  TopicEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopicEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TopicEntity;
  }

  @override
  void update(void Function(TopicEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopicEntity build() => _build();

  _$TopicEntity _build() {
    final _$result = _$v ??
        new _$TopicEntity._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'TopicEntity', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'TopicEntity', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
