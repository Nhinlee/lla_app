import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';
import 'package:lla_app/repository.dart';
import 'package:mime/mime.dart';

class RestLLARepository implements AbstractRepository {
  final Dio dio;

  const RestLLARepository({
    required this.dio,
  });

  @override
  Future<List<LearningItemEntity>> getLearningItems() async {
    final resp = await dio.get(
      RestApis.learningItems,
    );

    final learningItems = <LearningItemEntity>[];
    final listData = resp.data as List<dynamic>;
    for (final item in listData) {
      final learningItem = LearningItemEntity.fromJson(item);
      if (learningItem != null) {
        learningItems.add(learningItem);
      }
    }

    return learningItems;
  }

  @override
  Future<String> uploadLearningItem(
    LearningItemEntity learningItem,
  ) async {
    final body = learningItem.toJson();
    final resp = await dio.post(
      RestApis.learningItems,
      data: body,
    );

    // Return new li ID
    return resp.data['id'];
  }

  @override
  Future<FileStoreURL> getResumableUploadUrl(
    String fileName,
  ) async {
    final body = {
      'file_name': fileName,
    };

    final resp = await dio.post(
      RestApis.resumableUpload,
      data: body,
    );

    return FileStoreURL.fromJson(resp.data) ?? FileStoreURL();
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

  @override
  Future<List<TopicEntity>> getTopics() async {
    final resp = await dio.get(
      RestApis.topics,
    );

    final topics = <TopicEntity>[];
    final listData = resp.data as List<dynamic>;
    for (final item in listData) {
      final topic = TopicEntity.fromJson(item);
      if (topic != null) {
        topics.add(topic);
      }
    }

    return topics;
  }
}
