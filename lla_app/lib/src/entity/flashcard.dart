import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lla_app/entity.dart';

part 'flashcard.g.dart';

abstract class FlashcardEntity
    implements Built<FlashcardEntity, FlashcardEntityBuilder> {
  static Serializer<FlashcardEntity> get serializer =>
      _$flashcardEntitySerializer;

  String get id;

  @BuiltValueField(wireName: 'image_link')
  String get imageLink;

  @BuiltValueField(wireName: 'english_word')
  String get englishWord;

  @BuiltValueField(wireName: 'english_sentences')
  BuiltList<String> get englishSentences;

  @BuiltValueField(serialize: false)
  DateTime get createdAt;

  @BuiltValueField(serialize: false)
  DateTime get completedAt;

  static FlashcardEntity? fromJson(Map<String, dynamic> json) {
    final serialized = appSerializers.deserializeWith(
      FlashcardEntity.serializer,
      json,
    );

    if (serialized == null) {
      return null;
    }

    final builder = FlashcardEntityBuilder()..replace(serialized);

    // Custom deserialization for 'created_at' field
    if (json.containsKey('created_at')) {
      final createdAtString = json['created_at'] as String;
      final createdAt = DateTime.parse(createdAtString);
      builder.createdAt = createdAt;
    }

    // Custom deserialization for 'completed_at' field
    if (json.containsKey('completed_at')) {
      final completedAtString = json['completed_at'] as String;
      final completedAt = DateTime.parse(completedAtString);
      builder.completedAt = completedAt;
    }

    return builder.build();
  }

  FlashcardEntity._();

  factory FlashcardEntity([void Function(FlashcardEntityBuilder) updates]) =
      _$FlashcardEntity;
}
