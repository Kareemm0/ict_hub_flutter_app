import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_flutter/product_service.dart';
import 'package:ict_hub_flutter/presentation/cubit/products/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductIntialState());

  final ProductService api = ProductService();

  Future<void> fetchProducts() async {
    emit(ProductsLoadingState());
    final result = await api.fetchProducts();
    if (result.items!.isEmpty) {
      emit(ProductsFailureState(message: "List is Empty "));
    }
    emit(ProductsSuccessState(response: result));
  }
}
