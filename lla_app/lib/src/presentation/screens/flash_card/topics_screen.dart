import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/presentation.dart';
import 'package:lla_app/src/presentation/container/app_status_container.dart';
import 'package:redux/redux.dart';

class TopicsScreen<T extends AppState> extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState<T>();
}

class _TopicsScreenState<T extends AppState> extends State<TopicsScreen> {
  late Size _screenSize;
  late Store<T> _store;
  String _statusId = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenSize = MediaQuery.of(context).size;
    _store = StoreProvider.of<T>(context);

    onRefreshData();
  }

  Future<void> onRefreshData() async {
    final action = CountTotalLIByTopicIdsAction();
    setState(() {
      _statusId = action.statusId;
    });
    _store.dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefreshData(),
      child: AppStatusListener(
        statusId: _statusId,
        loadingPlaceHolder: const AppCircleLoading(),
        builder: (status) {
          return StoreConnector<T, TopicScreenVM>(
            converter: (store) {
              return TopicScreenVM.fromState(store.state);
            },
            builder: (context, vm) {
              final topics = vm.topics;

              return ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  final id = topics[index].id;
                  return Hero(
                    tag: HeroWidgetTags.getTopicHeroTag(id),
                    child: TopicWithTotalLIWidget(
                      index: index,
                      width: _screenSize.width,
                      topicEntity: topics[index],
                      totalLI: vm.totalLIByTopicIds[topics[index].id] ?? 0,
                      onTap: () => onNavigateToStartLearningScreen(
                        id,
                        index,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  void onNavigateToStartLearningScreen(
    String topicId,
    int index,
  ) {
    context.pushNamed(
      AppRoutes.startLearningScreen,
      queryParameters: {
        ParamKeys.topicId: topicId,
        ParamKeys.index: index.toString(),
      },
    );
  }
}
