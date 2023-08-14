import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:lla_app/entity.dart';

part 'serializes.g.dart';

@SerializersFor([
  LearningItemEntity,
  FileStoreURL,
])
final Serializers appSerializers =
    (_$appSerializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
