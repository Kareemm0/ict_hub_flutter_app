import 'package:fpdart/fpdart.dart';
import 'package:ict_hub_flutter/core/network/error/failures.dart';
import 'package:ict_hub_flutter/data/data_source/abstarct/product_deatils_data_source.dart';
import 'package:ict_hub_flutter/domain/repos/product_details_repo.dart';
import 'package:ict_hub_flutter/products_model.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  ProductDetailsRepoImpl({required this._dataSource});
  final ProductDeatilsDataSource _dataSource;

  @override
  Future<Either<Failure, ProductModel>> getProductDetails({
    required String productId,
  }) async {
    try {
      final response = await _dataSource.getProductDetails(
        productId: productId,
      );
      return response.fold(
        (failure) {
          return Left(DataMappingFailure(msg: "Some Went Wrong"));
        },
        (success) {
          return Right(ProductModel.fromJson(success));
        },
      );
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
