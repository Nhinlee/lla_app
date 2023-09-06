import 'package:built_value/built_value.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';
import 'package:redux/redux.dart';
import 'package:redux_simple/redux_simple.dart';

part 'flashcard_actions.g.dart';

abstract class GetFlashcardsAction extends Object
    with GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<GetFlashcardsAction, GetFlashcardsActionBuilder> {
  String get topicId;

  int get limit;

  factory GetFlashcardsAction.create({
    required String topicId,
    required int limit,
  }) {
    return GetFlashcardsAction(
      (updates) => updates
        ..topicId = topicId
        ..limit = limit,
    );
  }

  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    final flashcards = await AppRepo.repo.getFlashcards(
      topicId: topicId,
      limit: limit,
    );

    final flashcardsMap = <String, FlashcardEntity>{};
    for (final flashcard in flashcards) {
      flashcardsMap[flashcard.id] = flashcard;
    }

    yield store.state.rebuild(
      (updates) =>
          updates.flashcardState..flashcards[topicId] = BuiltMap(flashcardsMap),
    );
  }

  GetFlashcardsAction._();

  factory GetFlashcardsAction(
          [void Function(GetFlashcardsActionBuilder) updates]) =
      _$GetFlashcardsAction;
}

abstract class CompleteLearningFlashcardAction extends Object
    with
        GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<CompleteLearningFlashcardAction,
            CompleteLearningFlashcardActionBuilder> {
  BuiltList<String> get flashcardIds;

  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    await AppRepo.repo.completeFlashcards(
      flashcardIds: flashcardIds.toList(),
    );

    yield store.state;
  }

  CompleteLearningFlashcardAction._();

  factory CompleteLearningFlashcardAction.create({
    required BuiltList<String> flashcardIds,
  }) {
    return CompleteLearningFlashcardAction(
      (updates) => updates..flashcardIds = flashcardIds.toBuilder(),
    );
  }

  factory CompleteLearningFlashcardAction(
          [void Function(CompleteLearningFlashcardActionBuilder) updates]) =
      _$CompleteLearningFlashcardAction;
}
