import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ict_hub_flutter/app/routes.dart';
import 'package:ict_hub_flutter/core/cubit/theme/theme_state.dart';
import 'package:ict_hub_flutter/presentation/cubit/products/product_cubit.dart';
import 'package:ict_hub_flutter/presentation/cubit/products/product_state.dart';

import '../../core/cubit/theme/theme_cubit.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.title});

  final String title;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            actions: [
              Switch(
                value: state.isDark,
                onChanged: (v) {
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: state.isDark ? Colors.amber : Colors.red,
                ),
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                child: Text(state.isDark ? "Dark Theme" : "Light Theme"),
              ),
            ],
          ),
          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return switch (state) {
                ProductsLoadingState() => Center(
                  child: CircularProgressIndicator(),
                ),
                ProductsFailureState(:final message) => Center(
                  child: Column(
                    spacing: 16,
                    children: [
                      Text(message),
                      FilledButton(
                        onPressed: () {
                          context.read<ProductCubit>().fetchProducts();
                        },
                        child: Text("Try Again"),
                      ),
                    ],
                  ),
                ),
                ProductsSuccessState(:final response) => ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                  itemCount: response.items?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          Routes.productDetailsScreen,
                          queryParameters: {
                            "id": response.items?[index].id ?? "",
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.teal),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CachedNetworkImage(
                                height: 100,
                                width: 100,
                                imageUrl:
                                    response.items?[index].coverPictureUrl ??
                                    "",
                                errorWidget: (context, url, error) {
                                  return Icon(Icons.image_not_supported);
                                },
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  spacing: 8,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      response.items?[index].name ?? "N/D",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      response.items?[index].description ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(),
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                ),
                              ),
                              Text(
                                response.items?[index].price.toString() ?? "",
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                _ => SizedBox.expand(),
              };
            },
          ),
        );
      },
    );
  }
}
