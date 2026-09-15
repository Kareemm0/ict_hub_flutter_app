import 'package:dio/dio.dart';
import 'package:ict_hub_flutter/products_model.dart';

class ProductService {
  ProductService();
  final Dio dio = Dio();

  final String baseUrl = "https://accessories-eshop.runasp.net/api/products";

  Future<ProductsResponse> fetchProducts() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode != 200) {
        throw Exception();
        // return ProductsResponse.fromJson({});
      }
      return ProductsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception([e.toString()]);
    }
  }
}
