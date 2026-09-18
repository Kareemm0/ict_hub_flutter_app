import 'package:fpdart/fpdart.dart';
import 'package:ict_hub_flutter/core/network/error/failures.dart';

abstract class ProductDeatilsDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getProductDetails({
    required String productId,
  });
}
