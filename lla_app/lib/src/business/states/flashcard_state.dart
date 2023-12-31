import 'package:built_value/built_value.dart';
import 'package:lla_app/entity.dart';
import 'package:redux_simple/redux_simple.dart';

part 'flashcard_state.g.dart';

@BuiltValue(instantiable: false)
abstract class AbstractFlashcardFeature implements StatusState {
  FlashcardState get flashcardState;
}

abstract class FlashcardState
    implements Built<FlashcardState, FlashcardStateBuilder> {
  // Map<topicId, Map<flashcard_id, flashcard>>
  BuiltMap<String, BuiltMap<String, FlashcardEntity>> get flashcards;

  // Map<topicId, List<flashcard_id>>
  BuiltMap<String, BuiltList<String>> get completedFlashcards;

  FlashcardState._();
  factory FlashcardState([void Function(FlashcardStateBuilder) updates]) =
      _$FlashcardState;
}
