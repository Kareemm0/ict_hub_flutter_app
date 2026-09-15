import 'package:ict_hub_flutter/products_model.dart';

class ProductState {}

class ProductIntialState extends ProductState {}

class ProductsLoadingState extends ProductState {}

class ProductsSuccessState extends ProductState {
  final ProductsResponse response;

  ProductsSuccessState({required this.response});
}

class ProductsFailureState extends ProductState {
  final String message;

  ProductsFailureState({required this.message});
}
