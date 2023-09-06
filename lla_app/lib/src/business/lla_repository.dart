import 'dart:io';

import 'package:lla_app/entity.dart';

class AppRepo {
  static late AbstractRepository repo;
}

abstract class AbstractRepository {
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

  Future<List<TopicEntity>> getTopics();

  Future<Map<String, int>> getTotalLIByTopicIds();

  Future<List<FlashcardEntity>> getFlashcards({
    required String topicId,
    required int limit,
  });

  Future<void> completeFlashcards({
    required List<String> flashcardIds,
  });
}

class LLARepository extends AbstractRepository {
  final AbstractRepository restRepo;

  LLARepository({
    required this.restRepo,
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
}
