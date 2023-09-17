import 'package:built_value/built_value.dart';
import 'package:lla_app/entity.dart';
import 'package:redux_simple/redux_simple.dart';

part 'li_state.g.dart';

@BuiltValue(instantiable: false)
abstract class AbstractLIFeature implements StatusState {
  LearningItemState get liState;
}

abstract class LearningItemState
    implements Built<LearningItemState, LearningItemStateBuilder> {
  BuiltMap<String, LearningItemEntity> get learningItems;

  BuiltMap<String, String> get imageUrlByImageNames;

  BuiltMap<String, BuiltList<String>> get imageTitlesByImageNames;

  BuiltMap<String, BuiltList<String>> get englishSentencesByImageNames;

  @BuiltValueHook(initializeBuilder: true)
  static void _init(LearningItemStateBuilder builder) =>
      builder..learningItems = MapBuilder();

  LearningItemState._();

  factory LearningItemState([void Function(LearningItemStateBuilder) updates]) =
      _$LearningItemState;
}
