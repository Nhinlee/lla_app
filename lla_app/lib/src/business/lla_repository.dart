import 'package:lla_app/entity.dart';

class AppRepo {
  static late LLARepository repo;
}

abstract class LLARepository {
  Future<List<LearningItemEntity>> getLearningItems();
}
