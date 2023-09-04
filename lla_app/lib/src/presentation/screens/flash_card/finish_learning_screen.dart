import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/presentation.dart';
import 'package:redux/redux.dart';

class FinishLearningFLScreen<T extends AppState> extends StatefulWidget {
  const FinishLearningFLScreen({super.key});

  @override
  State<FinishLearningFLScreen> createState() =>
      _FinishLearningFLScreenState<T>();
}

class _FinishLearningFLScreenState<T extends AppState>
    extends State<FinishLearningFLScreen> {
  late Store<T> _store;
  List<String> _completedFlashcards = [];
  int _totalLIByTopic = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _store = StoreProvider.of<T>(context);

    // get completed flashcard by topic id
    final queryParameters = GoRouterState.of(context).uri.queryParameters;
    final topicId = queryParameters[ParamKeys.topicId] ?? "";

    _completedFlashcards =
        _store.state.flashcardState.completedFlashcards[topicId]?.toList() ??
            [];

    _totalLIByTopic = _store.state.topicState.totalLIByTopicIds[topicId] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finish Learning'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text('You have finished learning this topic.'),
            const SizedBox(height: 16),
            Expanded(
              child: Text(
                'You have learned ${_completedFlashcards.length} out of ${_totalLIByTopic} words.',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AppRoundedButton(
              text: 'Back to Topics',
              onPressed: () {
                Navigator.of(context).popUntil(
                  (route) => route.isFirst,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
