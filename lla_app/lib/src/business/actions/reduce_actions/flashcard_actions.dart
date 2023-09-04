import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lla_app/business.dart';
import 'package:redux_simple/redux_simple.dart';

part 'flashcard_actions.g.dart';

abstract class SaveCompletedFlashcardAction extends Object
    implements
        ReducerAction<AppState>,
        Built<SaveCompletedFlashcardAction,
            SaveCompletedFlashcardActionBuilder> {
  String get topicId;

  BuiltList<String> get completedFlashcards;

  factory SaveCompletedFlashcardAction.create({
    required String topicId,
    required BuiltList<String> completedFlashcards,
  }) {
    return _$SaveCompletedFlashcardAction((updates) => updates
      ..topicId = topicId
      ..completedFlashcards = completedFlashcards.toBuilder());
  }

  @override
  AppState call(
    AppState state,
  ) {
    return state.rebuild(
      (updates) => updates
        ..flashcardState.completedFlashcards.addAll({
          topicId: completedFlashcards,
        }),
    );
  }

  SaveCompletedFlashcardAction._();
  factory SaveCompletedFlashcardAction(
          [void Function(SaveCompletedFlashcardActionBuilder) updates]) =
      _$SaveCompletedFlashcardAction;
}
