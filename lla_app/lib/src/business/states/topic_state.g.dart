// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class AbstractTopicFeatureBuilder implements StatusStateBuilder {
  void replace(covariant AbstractTopicFeature other);
  void update(void Function(AbstractTopicFeatureBuilder) updates);
  TopicStateBuilder get topicState;
  set topicState(covariant TopicStateBuilder? topicState);

  MapBuilder<String, Status> get statuses;
  set statuses(covariant MapBuilder<String, Status>? statuses);
}

class _$TopicState extends TopicState {
  @override
  final BuiltMap<String, TopicEntity> topics;
  @override
  final BuiltMap<String, int> totalLIByTopicIds;

  factory _$TopicState([void Function(TopicStateBuilder)? updates]) =>
      (new TopicStateBuilder()..update(updates))._build();

  _$TopicState._({required this.topics, required this.totalLIByTopicIds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(topics, r'TopicState', 'topics');
    BuiltValueNullFieldError.checkNotNull(
        totalLIByTopicIds, r'TopicState', 'totalLIByTopicIds');
  }

  @override
  TopicState rebuild(void Function(TopicStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopicStateBuilder toBuilder() => new TopicStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopicState &&
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
    return (newBuiltValueToStringHelper(r'TopicState')
          ..add('topics', topics)
          ..add('totalLIByTopicIds', totalLIByTopicIds))
        .toString();
  }
}

class TopicStateBuilder implements Builder<TopicState, TopicStateBuilder> {
  _$TopicState? _$v;

  MapBuilder<String, TopicEntity>? _topics;
  MapBuilder<String, TopicEntity> get topics =>
      _$this._topics ??= new MapBuilder<String, TopicEntity>();
  set topics(MapBuilder<String, TopicEntity>? topics) =>
      _$this._topics = topics;

  MapBuilder<String, int>? _totalLIByTopicIds;
  MapBuilder<String, int> get totalLIByTopicIds =>
      _$this._totalLIByTopicIds ??= new MapBuilder<String, int>();
  set totalLIByTopicIds(MapBuilder<String, int>? totalLIByTopicIds) =>
      _$this._totalLIByTopicIds = totalLIByTopicIds;

  TopicStateBuilder();

  TopicStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _topics = $v.topics.toBuilder();
      _totalLIByTopicIds = $v.totalLIByTopicIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopicState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TopicState;
  }

  @override
  void update(void Function(TopicStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopicState build() => _build();

  _$TopicState _build() {
    _$TopicState _$result;
    try {
      _$result = _$v ??
          new _$TopicState._(
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
            r'TopicState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
