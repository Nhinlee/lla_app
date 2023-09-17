import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:lla_app/entity.dart';

class AppRepo {
  static late AbstractRepository repo;
}

abstract class AbstractRepository {
  /// User
  Future<String> login({
    required String email,
    required String password,
  });

  String getAccessToken();

  Future<void> setAccessToken(
    String accessToken,
  );

  Future<bool> verifyAccessToken({
    required String accessToken,
  });

  /// Learning Item
  Future<List<LearningItemEntity>> getLearningItems();

  Future<FileStoreURL> getResumableUploadUrl(
    String fileName,
  );

  Future<void> uploadFile(
    File file,
    String resumableUploadUrl,
  );

  Future<String> uploadLearningItem(
    LearningItemEntity learningItem,
  );

  /// Topic
  Future<List<TopicEntity>> getTopics();

  Future<Map<String, int>> getTotalLIByTopicIds();

  /// Flashcard
  Future<List<FlashcardEntity>> getFlashcards({
    required String topicId,
    required int limit,
  });

  Future<void> completeFlashcards({
    required List<String> flashcardIds,
  });

  Future<BuiltList<String>> generateImageTitles({
    required String imageName,
  });

  Future<BuiltList<String>> generateEnglishSentences({
    required String englishWord,
  });
}

class LLARepository extends AbstractRepository {
  final AbstractRepository restRepo;
  final AbstractRepository localRepo;

  LLARepository({
    required this.restRepo,
    required this.localRepo,
  });

  @override
  Future<List<LearningItemEntity>> getLearningItems() {
    return restRepo.getLearningItems();
  }

  @override
  Future<FileStoreURL> getResumableUploadUrl(
    String fileName,
  ) {
    return restRepo.getResumableUploadUrl(
      fileName,
    );
  }

  @override
  Future<String> uploadLearningItem(
    LearningItemEntity learningItem,
  ) {
    return restRepo.uploadLearningItem(
      learningItem,
    );
  }

  @override
  Future<void> uploadFile(
    File file,
    String resumableUploadUrl,
  ) {
    return restRepo.uploadFile(
      file,
      resumableUploadUrl,
    );
  }

  @override
  Future<List<TopicEntity>> getTopics() {
    return restRepo.getTopics();
  }

  @override
  Future<Map<String, int>> getTotalLIByTopicIds() {
    return restRepo.getTotalLIByTopicIds();
  }

  @override
  Future<List<FlashcardEntity>> getFlashcards({
    required String topicId,
    required int limit,
  }) {
    return restRepo.getFlashcards(
      topicId: topicId,
      limit: limit,
    );
  }

  @override
  Future<void> completeFlashcards({
    required List<String> flashcardIds,
  }) {
    return restRepo.completeFlashcards(
      flashcardIds: flashcardIds,
    );
  }

  @override
  Future<String> login({
    required String email,
    required String password,
  }) {
    return restRepo.login(
      email: email,
      password: password,
    );
  }

  @override
  String getAccessToken() {
    return localRepo.getAccessToken();
  }

  @override
  Future<void> setAccessToken(
    String accessToken,
  ) {
    return localRepo.setAccessToken(
      accessToken,
    );
  }

  @override
  Future<bool> verifyAccessToken({required String accessToken}) {
    return restRepo.verifyAccessToken(
      accessToken: accessToken,
    );
  }

  @override
  Future<BuiltList<String>> generateImageTitles({
    required String imageName,
  }) {
    return restRepo.generateImageTitles(
      imageName: imageName,
    );
  }

  @override
  Future<BuiltList<String>> generateEnglishSentences({
    required String englishWord,
  }) {
    return restRepo.generateEnglishSentences(
      englishWord: englishWord,
    );
  }
}
