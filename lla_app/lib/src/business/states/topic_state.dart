import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lla_app/entity.dart';
import 'package:redux_simple/redux_simple.dart';

part 'topic_state.g.dart';

@BuiltValue(instantiable: false)
abstract class AbstractTopicFeature implements StatusState {
  TopicState get topicState;
}

abstract class TopicState implements Built<TopicState, TopicStateBuilder> {
  BuiltMap<String, TopicEntity> get topics;

  TopicState._();

  factory TopicState([void Function(TopicStateBuilder) updates]) = _$TopicState;
}
