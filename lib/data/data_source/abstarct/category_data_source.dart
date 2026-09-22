import 'package:fpdart/fpdart.dart';
import 'package:ict_hub_flutter/core/network/error/failures.dart';

abstract class CategoryDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getCategories(); 
}
