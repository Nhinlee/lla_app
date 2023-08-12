import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'learning_item_entity.g.dart';

abstract class LearningItemEntity
    implements Built<LearningItemEntity, LearningItemEntityBuilder> {
  String get id;

  String get imageLink;

  String get englishWord;

  String get vietnameseWord;

  BuiltList<String> get englishSentences;

  LearningItemEntity._();

  static void _initializeBuilder(LearningItemEntityBuilder b) => b
    ..id = ''
    ..imageLink = ''
    ..englishWord = ''
    ..vietnameseWord = ''
    ..englishSentences = ListBuilder<String>();

  factory LearningItemEntity(
          [void Function(LearningItemEntityBuilder) updates]) =
      _$LearningItemEntity;
}
