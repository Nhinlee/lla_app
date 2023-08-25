import 'package:built_value/built_value.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';
import 'package:redux/redux.dart';
import 'package:redux_simple/redux_simple.dart';

part 'topic_actions.g.dart';

abstract class GetAllTopicsAction extends Object
    with GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<GetAllTopicsAction, GetAllTopicsActionBuilder> {
  GetAllTopicsAction._();

  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    final topics = await AppRepo.repo.getTopics();

    final topicsMap = <String, TopicEntity>{};
    for (final topic in topics) {
      topicsMap[topic.id] = topic;
    }

    yield store.state.rebuild(
      (updates) => updates.topicState..topics = MapBuilder(topicsMap),
    );
  }

  factory GetAllTopicsAction(
          [void Function(GetAllTopicsActionBuilder) updates]) =
      _$GetAllTopicsAction;
}

abstract class CountTotalLIByTopicIdsAction extends Object
    with
        GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<CountTotalLIByTopicIdsAction,
            CountTotalLIByTopicIdsActionBuilder> {
  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    final topics = await AppRepo.repo.getTopics();
    final totalLIByTopicIds = await AppRepo.repo.getTotalLIByTopicIds();

    final topicsMap = <String, TopicEntity>{};
    for (final topic in topics) {
      topicsMap[topic.id] = topic;
    }

    yield store.state.rebuild(
      (updates) => updates.topicState
        ..topics.addAll(topicsMap)
        ..totalLIByTopicIds = MapBuilder(
          totalLIByTopicIds,
        ),
    );
  }

  CountTotalLIByTopicIdsAction._();
  factory CountTotalLIByTopicIdsAction(
          [void Function(CountTotalLIByTopicIdsActionBuilder) updates]) =
      _$CountTotalLIByTopicIdsAction;
}
