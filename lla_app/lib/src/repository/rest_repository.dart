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

  @override
  Future<Map<String, int>> getTotalLIByTopicIds() async {
    final resp = await dio.get(
      RestApis.topicsWithTotalLI,
    );

    final totalLIByTopicIds = <String, int>{};
    final listData = resp.data as List<dynamic>;

    for (final item in listData) {
      final topicId = item['id'] as String;
      final totalLI = item['total_learning_items'] as int;
      totalLIByTopicIds[topicId] = totalLI;
    }

    return totalLIByTopicIds;
  }

  @override
  Future<List<FlashcardEntity>> getFlashcards({
    required String topicId,
    required int limit,
  }) async {
    final body = {
      'topic_id': topicId,
      'limit': limit,
    };

    final resp = await dio.post(
      RestApis.learningFlashcards,
      data: body,
    );

    final flashcards = <FlashcardEntity>[];
    final listData = resp.data as List<dynamic>;
    for (final item in listData) {
      final flashcard = FlashcardEntity.fromJson(item);
      if (flashcard != null) {
        flashcards.add(flashcard);
      }
    }

    return flashcards;
  }

  @override
  Future<void> completeFlashcards({
    required List<String> flashcardIds,
  }) {
    final body = {
      'ids': flashcardIds,
    };

    return dio.post(
      RestApis.completeFlashcards,
      data: body,
    );
  }

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    final body = {
      'email': email,
      'password': password,
    };

    final resp = await  dio.post(
      RestApis.login,
      data: body,
    );

    return resp.data['token'];
  }
}
