import 'dart:io';

import 'package:lla_app/entity.dart';

class AppRepo {
  static late AbstractRepository repo;
}

abstract class AbstractRepository {
  Future<List<LearningItemEntity>> getLearningItems();

  Future<String> getResumableUploadUrl(
    String fileName,
  );

  Future<void> uploadFile(
    File file,
    String resumableUploadUrl,
  );

  Future<void> uploadLearningItem(
    LearningItemEntity learningItem,
  );
}

class LLARepository extends AbstractRepository {
  final AbstractRepository restRepo;

  LLARepository({
    required this.restRepo,
  });

  @override
  Future<List<LearningItemEntity>> getLearningItems() {
    // TODO: implement getLearningItems
    throw UnimplementedError();
  }

  @override
  Future<String> getResumableUploadUrl(
    String fileName,
  ) {
    return restRepo.getResumableUploadUrl(
      fileName,
    );
  }

  @override
  Future<void> uploadLearningItem(
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
}
