import 'package:lla_app/entity.dart';

abstract class LLARepository {
  Future<List<LearningItemEntity>> getLearningItems();
}
