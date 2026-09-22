import 'package:fpdart/fpdart.dart';
import 'package:ict_hub_flutter/core/network/error/failures.dart';
import 'package:ict_hub_flutter/domain/models/categories_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, CategoriesResponse>> getCategories();
}
