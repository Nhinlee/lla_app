import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';

part 'topic_screen_vm.g.dart';

abstract class TopicScreenVM
    implements Built<TopicScreenVM, TopicScreenVMBuilder> {
  BuiltList<TopicEntity> get topics;

  BuiltMap<String, int> get totalLIByTopicIds;

  factory TopicScreenVM.fromState(AppState state) {
    return TopicScreenVM(
      (updates) => updates
        ..topics = state.topicState.topics.values.toBuiltList().toBuilder()
        ..totalLIByTopicIds = state.topicState.totalLIByTopicIds.toBuilder(),
    );
  }

  TopicScreenVM._();
  factory TopicScreenVM([void Function(TopicScreenVMBuilder) updates]) =
      _$TopicScreenVM;
}
