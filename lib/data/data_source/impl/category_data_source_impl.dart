import 'package:fpdart/fpdart.dart';
import 'package:ict_hub_flutter/core/network/api/api_consumer.dart';
import 'package:ict_hub_flutter/core/network/api/endpoints.dart';
import 'package:ict_hub_flutter/core/network/error/failures.dart';
import 'package:ict_hub_flutter/data/data_source/abstarct/category_data_source.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  final ApiConsumer _apiConsumer;

  /// Firebase
  /// Local DataBase

  CategoryDataSourceImpl({required this._apiConsumer});
  @override
  Future<Either<Failure, Map<String, dynamic>>> getCategories() async {
    final response = await _apiConsumer.get(path: Endpoints.category);

    return response; 
  }
}
