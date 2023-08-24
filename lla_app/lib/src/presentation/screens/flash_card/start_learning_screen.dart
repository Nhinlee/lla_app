import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';
import 'package:lla_app/presentation.dart';
import 'package:redux/redux.dart';

class StartLearningScreen<T extends AppState> extends StatefulWidget {
  const StartLearningScreen({
    super.key,
  });

  @override
  State<StartLearningScreen> createState() => _StartLearningScreenState<T>();
}

class _StartLearningScreenState<T extends AppState>
    extends State<StartLearningScreen> {
  late Size _screenSize;
  late Store<T> _store;
  late TopicEntity _topicEntity;
  int _totalLI = 0;
  int _chooseLICount = 0;
  int _index = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenSize = MediaQuery.of(context).size;
    _store = StoreProvider.of<T>(context);

    final queryParameters = GoRouterState.of(context).uri.queryParameters;
    final topicId = queryParameters[ParamKeys.topicId] ?? "";
    _index = int.parse(queryParameters[ParamKeys.index] ?? "0");

    _topicEntity = _store.state.topicState.topics[topicId] ?? TopicEntity();
    _totalLI = _store.state.topicState.totalLIByTopicIds[topicId] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flash Card",
          style: AppTextStyle.appBarTitle,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          buildTopicCard(),
          const SizedBox(height: 50),
          buildChoosenWordCountContainer(),
          const SizedBox(height: 24),
          buildWordSlider(),
          const Spacer(),
          buildStartButton(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildStartButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: _screenSize.width,
        height: 60,
        child: ElevatedButton(
          onPressed: _chooseLICount > 0
              ? () {
                  context.pushNamed(
                    AppRoutes.flashcardScreen,
                    queryParameters: {
                      ParamKeys.topicId: _topicEntity.id,
                      ParamKeys.limit: _chooseLICount.toString(),
                    },
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: const Text(
            "Start learning",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Padding buildWordSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Slider(
        value: _chooseLICount * 1.0,
        onChanged: (value) {
          setState(() {
            _chooseLICount = value.toInt();
          });
        },
        min: 0,
        max: _totalLI * 1.0,
      ),
    );
  }

  Hero buildTopicCard() {
    return Hero(
      tag: HeroWidgetTags.getTopicHeroTag(_topicEntity.id),
      child: TopicWithTotalLIWidget(
        width: _screenSize.width,
        topicEntity: _topicEntity,
        totalLI: _totalLI,
        index: _index,
        showArrowIcon: false,
      ),
    );
  }

  Padding buildChoosenWordCountContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "We will optimize the words order to help you better learn.",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "$_chooseLICount / $_totalLI words",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
