import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lla_app/entity.dart';

part 'learning_item.g.dart';

abstract class LearningItemEntity
    implements Built<LearningItemEntity, LearningItemEntityBuilder> {
  static Serializer<LearningItemEntity> get serializer =>
      _$learningItemEntitySerializer;

  String get id;

  @BuiltValueField(wireName: 'image_link')
  String get imageLink;

  @BuiltValueField(wireName: 'english_word')
  String get englishWord;

  @BuiltValueField(wireName: 'vietnamese_word')
  String get vietnameseWord;

  @BuiltValueField(wireName: 'english_sentences')
  BuiltList<String> get englishSentences;

  @BuiltValueField(wireName: 'topic_id')
  String get topicId;

  @BuiltValueField(serialize: false)
  DateTime get createdAt;

  static DateTime _dateTimeFromJson(dynamic value) {
    return DateTime.parse(value as String); // Adjust the parsing as needed
  }

  Map<String, dynamic> toJson() {
    return appSerializers.serializeWith(
      LearningItemEntity.serializer,
      this,
    ) as Map<String, dynamic>;
  }

  static LearningItemEntity? fromJson(Map<String, dynamic> json) {
    final serialized = appSerializers.deserializeWith(
      LearningItemEntity.serializer,
      json,
    );

    if (serialized == null) {
      return null;
    }

    final builder = LearningItemEntityBuilder()..replace(serialized);

    // Custom deserialization for 'created_at' field
    if (json.containsKey('created_at')) {
      final createdAtString = json['created_at'] as String;
      final createdAt = DateTime.parse(createdAtString);
      builder.createdAt = createdAt;
    }

    return builder.build();
  }

  LearningItemEntity._();

  static void _initializeBuilder(LearningItemEntityBuilder b) => b
    ..id = ''
    ..imageLink = ''
    ..englishWord = ''
    ..vietnameseWord = ''
    ..englishSentences = ListBuilder<String>()
    ..topicId = ''
    ..createdAt = DateTime.now();

  factory LearningItemEntity(
          [void Function(LearningItemEntityBuilder) updates]) =
      _$LearningItemEntity;
}
