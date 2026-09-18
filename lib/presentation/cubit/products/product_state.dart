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

class ProductsDetailsLoadingstate extends ProductsSuccessState {
  ProductsDetailsLoadingstate({required super.response});
}

class ProductsDetailsSuccessState extends ProductsSuccessState {
  ProductsDetailsSuccessState({required super.response, required this.details});

  final ProductModel details;
}

class ProductsDetailsFailureState extends ProductsSuccessState {
  ProductsDetailsFailureState({required super.response, required this.message});

  final String message;
}
