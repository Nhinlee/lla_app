import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lla_app/entity.dart';

part 'topic_entity.g.dart';

abstract class TopicEntity implements Built<TopicEntity, TopicEntityBuilder> {
  static Serializer<TopicEntity> get serializer => _$topicEntitySerializer;

  String get id;

  String get name;

  TopicEntity._();
  factory TopicEntity([void Function(TopicEntityBuilder) updates]) =
      _$TopicEntity;

  static TopicEntity? fromJson(Map<String, dynamic> json) {
    return appSerializers.deserializeWith(serializer, json);
  }
}
