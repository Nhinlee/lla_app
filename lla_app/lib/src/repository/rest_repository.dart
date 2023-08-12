import 'package:dio/dio.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/src/entity/learning_item_entity.dart';

class RestLLARepository implements LLARepository {
  final Dio dio;

  const RestLLARepository({
    required this.dio,
  });

  @override
  Future<List<LearningItemEntity>> getLearningItems() {
    throw UnimplementedError();
  }
}
