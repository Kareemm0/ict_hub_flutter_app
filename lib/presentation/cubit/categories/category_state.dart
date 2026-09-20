import 'package:ict_hub_flutter/domain/models/categories_model.dart';

class CategoryState {}

class CategoriresInitlaState extends CategoryState {}

class CategoriresLoadingState extends CategoryState {}

class CategoriresSuccessState extends CategoryState {
  final CategoriesResponse response;

  CategoriresSuccessState({required this.response});
}

class CategoriresFailureState extends CategoryState {
  final String message;

  CategoriresFailureState({required this.message});
}
