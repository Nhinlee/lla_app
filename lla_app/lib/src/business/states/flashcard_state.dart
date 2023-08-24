import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lla_app/entity.dart';
import 'package:redux_simple/redux_simple.dart';

part 'flashcard_state.g.dart';

@BuiltValue(instantiable: false)
abstract class AbstractFlashcardFeature implements StatusState {
  FlashcardState get flashcardState;
}

abstract class FlashcardState
    implements Built<FlashcardState, FlashcardStateBuilder> {
  BuiltMap<String, FlashcardEntity> get flashcards;

  FlashcardState._();
  factory FlashcardState([void Function(FlashcardStateBuilder) updates]) =
      _$FlashcardState;
}
