import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/repository.dart';
import 'package:lla_app/src/entity/learning_item_entity.dart';
import 'package:mime/mime.dart';

class RestLLARepository implements AbstractRepository {
  final Dio dio;

  const RestLLARepository({
    required this.dio,
  });

  @override
  Future<List<LearningItemEntity>> getLearningItems() {
    throw UnimplementedError();
  }

  @override
  Future<void> uploadLearningItem(
    LearningItemEntity learningItem,
  ) {
    final body = learningItem.toJson();
    return dio.post(
      RestApis.learningItems,
      data: body,
    );
  }

  @override
  Future<String> getResumableUploadUrl(
    String fileName,
  ) async {
    final body = {
      'file_name': fileName,
    };

    final resp = await dio.post(
      RestApis.resumableUpload,
      data: body,
    );

    return resp.data['presigned_url'];
  }

  @override
  Future<void> uploadFile(
    File file,
    String resumableUploadUrl,
  ) {
    // get mime type of file
    final mimeType = lookupMimeType(file.path);

    return dio.put(
      resumableUploadUrl,
      onSendProgress: (int sent, int total) {
        print(">> sent: $sent, total: $total");
      },
      data: file.readAsBytesSync(),
      options: Options(
        contentType: mimeType,
      ),
    );
  }
}
