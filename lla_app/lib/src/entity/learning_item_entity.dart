import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lla_app/entity.dart';

part 'learning_item_entity.g.dart';

abstract class LearningItemEntity
    implements Built<LearningItemEntity, LearningItemEntityBuilder> {
  static Serializer<LearningItemEntity> get serializer =>
      _$learningItemEntitySerializer;

  String get id;

  @BuiltValueField(wireName: 'image_url')
  String get imageLink;

  @BuiltValueField(wireName: 'english_word')
  String get englishWord;

  @BuiltValueField(wireName: 'vietnamese_word')
  String get vietnameseWord;

  @BuiltValueField(wireName: 'english_sentences')
  BuiltList<String> get englishSentences;

  Map<String, dynamic> toJson() {
    return appSerializers.serializeWith(
      LearningItemEntity.serializer,
      this,
    ) as Map<String, dynamic>;
  }

  static LearningItemEntity? fromJson(Map<String, dynamic> json) {
    return appSerializers.deserializeWith(
      LearningItemEntity.serializer,
      json,
    );
  }

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
