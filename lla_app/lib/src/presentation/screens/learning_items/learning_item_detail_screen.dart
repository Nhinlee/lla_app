import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';
import 'package:lla_app/presentation.dart';
import 'package:redux/redux.dart';

class LearningItemDetailScreen<T extends AppState> extends StatefulWidget {
  const LearningItemDetailScreen({Key? key}) : super(key: key);

  @override
  State<LearningItemDetailScreen> createState() =>
      _LearningItemDetailScreenState<T>();
}

class _LearningItemDetailScreenState<T extends AppState>
    extends State<LearningItemDetailScreen> {
  double _screenWidth = 0;
  String _learningItemId = "";

  late Store<T> _store;
  late LearningItemEntity _learningItem;

  final _englishSentences = [
    "The wind acted like a hairdryer, playing with her hair.",
    "An old hairdryer roared, bringing back old memories.",
    "The spaceship's panel lit up like a hairdryer's warm glow.",
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get media query data
    final mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;

    // Get query parameters
    final queryParameters = GoRouterState.of(context).uri.queryParameters;
    _learningItemId = queryParameters[ParamKeys.learningItemId] ?? "";

    // Get store
    _store = StoreProvider.of<T>(context);
    print("learning_item_detail_screen.dart: didChangeDependencies: "
        "_learningItemId: ${_store.state.liState.learningItems}");
    _learningItem = _store.state.liState.learningItems[_learningItemId] ??
        LearningItemEntity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "learning_item_$_learningItemId",
              child: buildLIImageContainer(),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: buildTitleAndDescContainer(context),
            ),
            const SizedBox(height: 24),
            // list of english sentences widget
            ...buildEnglishSentencesWidget(),
          ],
        ),
      ),
    );
  }

  Container buildLIImageContainer() {
    return Container(
      width: _screenWidth,
      height: _screenWidth,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Image.network(
        _learningItem.imageLink,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildTitleAndDescContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _learningItem.englishWord,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 16),
        Text(
          _learningItem.vietnameseWord,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  List<Widget> buildEnglishSentencesWidget() {
    return _englishSentences.map((sentence) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                sentence,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up),
            ),
          ],
        ),
      );
    }).toList();
  }
}
