import 'package:fpdart/fpdart.dart';
import 'package:ict_hub_flutter/core/network/error/failures.dart';
import 'package:ict_hub_flutter/products_model.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductModel>> getProductDetails({
    required String productId,
  });
}
