import 'package:fpdart/fpdart.dart';
import 'package:ict_hub_flutter/core/network/error/failures.dart';
import 'package:ict_hub_flutter/data/data_source/abstarct/category_data_source.dart';
import 'package:ict_hub_flutter/domain/models/categories_model.dart';
import 'package:ict_hub_flutter/domain/repos/category_repo.dart';

class CateogriesRepoImpl implements CategoryRepo {
  CateogriesRepoImpl({required this._dataSource});
  final CategoryDataSource _dataSource;

  @override
  Future<Either<Failure, CategoriesResponse>> getCategories() async {
    try {
      /// Call Data Source
      final Either<Failure, Map<String, dynamic>> response = await _dataSource
          .getCategories();

      return response.fold(
        (failure) {
          return Left(DataMappingFailure(msg: failure.msg));
        },
        (success) {
          return Right(CategoriesResponse.fromJson(success));
        },
      );
    } catch (e) {
      return Left(DataMappingFailure(msg: e.toString()));
    }
  }
}
