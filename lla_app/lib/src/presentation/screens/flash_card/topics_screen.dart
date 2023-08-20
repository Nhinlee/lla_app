import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';
import 'package:lla_app/presentation.dart';
import 'package:lla_app/src/presentation/container/app_status_container.dart';
import 'package:redux/redux.dart';

class TopicsScreen<T extends AppState> extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState<T>();
}

class _TopicsScreenState<T extends AppState> extends State<TopicsScreen> {
  final bgColorList = [
    Colors.purple,
    Color(0xFFDB6D6D),
    Color(0xFFE7B768),
  ];

  final overlayColorList = [
    Color(0xFFFDCC4A).withOpacity(0.8),
    Color(0xFF7CC6D6),
    Color(0xFF858C94),
  ];

  late Size _screenSize;
  late Store<T> store;
  String _statusId = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenSize = MediaQuery.of(context).size;
    store = StoreProvider.of<T>(context);

    onRefreshData();
  }

  Future<void> onRefreshData() async {
    final action = CountTotalLIByTopicIdsAction();
    setState(() {
      _statusId = action.statusId;
    });
    store.dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefreshData(),
      child: AppStatusListener(
        statusId: _statusId,
        loadingPlaceHolder: AppCircleLoading(),
        builder: (status) {
          final topics = store.state.topicState.topics.values.toList();
          final totalLIByTopicIds = store.state.topicState.totalLIByTopicIds;

          return ListView.builder(
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return buildTopicItemContainer(
                topics[index],
                totalLIByTopicIds[topics[index].id] ?? 0,
                bgColorList[index % 3],
                overlayColorList[index % 3],
              );
            },
          );
        },
      ),
    );
  }

  Padding buildTopicItemContainer(
    TopicEntity topicEntity,
    int totalLI,
    Color bgColor,
    Color overlayColor,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: _screenSize.width,
        height: _screenSize.width / 2,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          // background color with gradient
          gradient: LinearGradient(
            colors: [
              bgColor,
              bgColor.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -36,
              right: -39,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: overlayColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: -45,
              bottom: -68,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: overlayColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Container(
              width: _screenSize.width,
              height: _screenSize.width / 2,
              child: buildTopicContent(
                topicEntity.name,
                totalLI,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildTopicContent(
    String topicName,
    int totalLI,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(width: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              topicName,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "$totalLI words",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        const SizedBox(width: 32),
      ],
    );
  }
}
