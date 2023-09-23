// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_screen_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TopicScreenVM extends TopicScreenVM {
  @override
  final BuiltList<TopicEntity> topics;
  @override
  final BuiltMap<String, int> totalLIByTopicIds;

  factory _$TopicScreenVM([void Function(TopicScreenVMBuilder)? updates]) =>
      (new TopicScreenVMBuilder()..update(updates))._build();

  _$TopicScreenVM._({required this.topics, required this.totalLIByTopicIds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(topics, r'TopicScreenVM', 'topics');
    BuiltValueNullFieldError.checkNotNull(
        totalLIByTopicIds, r'TopicScreenVM', 'totalLIByTopicIds');
  }

  @override
  TopicScreenVM rebuild(void Function(TopicScreenVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopicScreenVMBuilder toBuilder() => new TopicScreenVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopicScreenVM &&
        topics == other.topics &&
        totalLIByTopicIds == other.totalLIByTopicIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, topics.hashCode);
    _$hash = $jc(_$hash, totalLIByTopicIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TopicScreenVM')
          ..add('topics', topics)
          ..add('totalLIByTopicIds', totalLIByTopicIds))
        .toString();
  }
}

class TopicScreenVMBuilder
    implements Builder<TopicScreenVM, TopicScreenVMBuilder> {
  _$TopicScreenVM? _$v;

  ListBuilder<TopicEntity>? _topics;
  ListBuilder<TopicEntity> get topics =>
      _$this._topics ??= new ListBuilder<TopicEntity>();
  set topics(ListBuilder<TopicEntity>? topics) => _$this._topics = topics;

  MapBuilder<String, int>? _totalLIByTopicIds;
  MapBuilder<String, int> get totalLIByTopicIds =>
      _$this._totalLIByTopicIds ??= new MapBuilder<String, int>();
  set totalLIByTopicIds(MapBuilder<String, int>? totalLIByTopicIds) =>
      _$this._totalLIByTopicIds = totalLIByTopicIds;

  TopicScreenVMBuilder();

  TopicScreenVMBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _topics = $v.topics.toBuilder();
      _totalLIByTopicIds = $v.totalLIByTopicIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopicScreenVM other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TopicScreenVM;
  }

  @override
  void update(void Function(TopicScreenVMBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopicScreenVM build() => _build();

  _$TopicScreenVM _build() {
    _$TopicScreenVM _$result;
    try {
      _$result = _$v ??
          new _$TopicScreenVM._(
              topics: topics.build(),
              totalLIByTopicIds: totalLIByTopicIds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'topics';
        topics.build();
        _$failedField = 'totalLIByTopicIds';
        totalLIByTopicIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TopicScreenVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
