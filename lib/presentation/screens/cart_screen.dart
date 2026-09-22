import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_flutter/presentation/cubit/categories/category_cubit.dart';
import 'package:ict_hub_flutter/presentation/cubit/categories/category_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CategoryCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return switch (state) {
          CategoriresFailureState(:final message) => Center(
            child: Text(message),
          ),
          CategoriresSuccessState(:final response) => ListView.builder(
            itemCount: response.categories.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                child: CachedNetworkImage(
                  height: 100,
                  width: 100,
                  imageUrl: response.categories[index].coverPictureUrl,
                  errorWidget: (context, url, error) {
                    return Icon(Icons.abc_outlined);
                  },
                ),
              );
            },
          ),
          _ => SizedBox.shrink(),
        };
      },
    );
  }
}
