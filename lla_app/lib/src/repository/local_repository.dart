import 'dart:io';

import 'package:lla_app/business.dart';
import 'package:lla_app/src/entity/common/filestore_url.dart';
import 'package:lla_app/src/entity/flashcard.dart';
import 'package:lla_app/src/entity/learning_item.dart';
import 'package:lla_app/src/entity/topic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository extends AbstractRepository {
  final SharedPreferences sharedRef;

  LocalRepository({
    required this.sharedRef,
  });

  @override
  Future<void> completeFlashcards({required List<String> flashcardIds}) {
    // TODO: implement completeFlashcards
    throw UnimplementedError();
  }

  @override
  Future<List<FlashcardEntity>> getFlashcards(
      {required String topicId, required int limit}) {
    // TODO: implement getFlashcards
    throw UnimplementedError();
  }

  @override
  Future<List<LearningItemEntity>> getLearningItems() {
    // TODO: implement getLearningItems
    throw UnimplementedError();
  }

  @override
  Future<FileStoreURL> getResumableUploadUrl(String fileName) {
    // TODO: implement getResumableUploadUrl
    throw UnimplementedError();
  }

  @override
  Future<List<TopicEntity>> getTopics() {
    // TODO: implement getTopics
    throw UnimplementedError();
  }

  @override
  Future<Map<String, int>> getTotalLIByTopicIds() {
    // TODO: implement getTotalLIByTopicIds
    throw UnimplementedError();
  }

  @override
  Future<String> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> uploadFile(File file, String resumableUploadUrl) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }

  @override
  Future<String> uploadLearningItem(LearningItemEntity learningItem) {
    // TODO: implement uploadLearningItem
    throw UnimplementedError();
  }

  @override
  String getAccessToken() {
    return sharedRef.getString('access_token') ?? '';
  }

  @override
  Future<void> setAccessToken(
    String accessToken,
  ) {
    return sharedRef.setString(
      'access_token',
      accessToken,
    );
  }

  @override
  Future<bool> verifyAccessToken({
    required String accessToken,
  }) {
    // TODO: implement verifyAccessToken
    throw UnimplementedError();
  }
}
