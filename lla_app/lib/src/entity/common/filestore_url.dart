import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lla_app/entity.dart';

part 'filestore_url.g.dart';

abstract class FileStoreURL
    implements Built<FileStoreURL, FileStoreURLBuilder> {
  static Serializer<FileStoreURL> get serializer => _$fileStoreURLSerializer;

  @BuiltValueField(wireName: 'presigned_url')
  String get resumableUploadUrl;

  @BuiltValueField(wireName: 'public_url')
  String get publicUrl;

  static FileStoreURL? fromJson(Map<String, dynamic> json) {
    return appSerializers.deserializeWith(
      FileStoreURL.serializer,
      json,
    );
  }

  static void _initializeBuilder(FileStoreURLBuilder b) => b
    ..resumableUploadUrl = ''
    ..publicUrl = '';

  FileStoreURL._();

  factory FileStoreURL([void Function(FileStoreURLBuilder) updates]) =
      _$FileStoreURL;
}
