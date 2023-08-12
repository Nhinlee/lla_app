import 'package:dio/dio.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/src/entity/learning_item_entity.dart';

class RestLLARepository implements LLARepository {
  final Dio _dio;

  const RestLLARepository(this._dio);

  @override
  Future<List<LearningItemEntity>> getLearningItems() {
    throw UnimplementedError();
  }
}
