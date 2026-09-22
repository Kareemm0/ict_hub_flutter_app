import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_flutter/domain/repos/category_repo.dart';
import 'package:ict_hub_flutter/presentation/cubit/categories/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this._repo}) : super(CategoriresInitlaState());

  final CategoryRepo _repo;

  Future<void> getCategories() async {
    emit(CategoriresLoadingState());

    /// Call Model(CategoriesResponse)
    final result = await _repo.getCategories();
    result.fold(
      (failure) {
        emit(CategoriresFailureState(message: failure.msg));
      },
      (success) {
        emit(CategoriresSuccessState(response: success));
      },
    );
  }
}
