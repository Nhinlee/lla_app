// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final LearningItemState liState;
  @override
  final BuiltMap<String, Status> statuses;
  @override
  final TopicState topicState;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates))._build();

  _$AppState._(
      {required this.liState, required this.statuses, required this.topicState})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(liState, r'AppState', 'liState');
    BuiltValueNullFieldError.checkNotNull(statuses, r'AppState', 'statuses');
    BuiltValueNullFieldError.checkNotNull(
        topicState, r'AppState', 'topicState');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        liState == other.liState &&
        statuses == other.statuses &&
        topicState == other.topicState;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, liState.hashCode);
    _$hash = $jc(_$hash, statuses.hashCode);
    _$hash = $jc(_$hash, topicState.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('liState', liState)
          ..add('statuses', statuses)
          ..add('topicState', topicState))
        .toString();
  }
}

class AppStateBuilder
    implements
        Builder<AppState, AppStateBuilder>,
        AbstractLIFeatureBuilder,
        AbstractTopicFeatureBuilder,
        StatusStateBuilder {
  _$AppState? _$v;

  LearningItemStateBuilder? _liState;
  LearningItemStateBuilder get liState =>
      _$this._liState ??= new LearningItemStateBuilder();
  set liState(covariant LearningItemStateBuilder? liState) =>
      _$this._liState = liState;

  MapBuilder<String, Status>? _statuses;
  MapBuilder<String, Status> get statuses =>
      _$this._statuses ??= new MapBuilder<String, Status>();
  set statuses(covariant MapBuilder<String, Status>? statuses) =>
      _$this._statuses = statuses;

  TopicStateBuilder? _topicState;
  TopicStateBuilder get topicState =>
      _$this._topicState ??= new TopicStateBuilder();
  set topicState(covariant TopicStateBuilder? topicState) =>
      _$this._topicState = topicState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _liState = $v.liState.toBuilder();
      _statuses = $v.statuses.toBuilder();
      _topicState = $v.topicState.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
// ignore: override_on_non_overriding_method
  void replace(covariant AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppState build() => _build();

  _$AppState _build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              liState: liState.build(),
              statuses: statuses.build(),
              topicState: topicState.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'liState';
        liState.build();
        _$failedField = 'statuses';
        statuses.build();
        _$failedField = 'topicState';
        topicState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
