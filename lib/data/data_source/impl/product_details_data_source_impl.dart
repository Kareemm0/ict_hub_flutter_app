import 'package:fpdart/fpdart.dart';
import 'package:ict_hub_flutter/core/network/api/api_consumer.dart';
import 'package:ict_hub_flutter/core/network/api/endpoints.dart';
import 'package:ict_hub_flutter/core/network/error/failures.dart';
import 'package:ict_hub_flutter/data/data_source/abstarct/product_deatils_data_source.dart';

class ProductDetailsDataSourceImpl implements ProductDeatilsDataSource {
  ProductDetailsDataSourceImpl({required this._dio});
  final ApiConsumer _dio;

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProductDetails({
    required String productId,
  }) async {
    final response = await _dio.get(
      path: "${Endpoints.productsDetails}/$productId",
    );

    return response;
  }
}
