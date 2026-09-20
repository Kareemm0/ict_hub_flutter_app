import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_flutter/presentation/cubit/products/product_cubit.dart';
import 'package:ict_hub_flutter/presentation/cubit/products/product_state.dart';

class ProcductDeatilsScreen extends StatefulWidget {
  const ProcductDeatilsScreen({super.key, required this.productId});

  final String productId;

  @override
  State<ProcductDeatilsScreen> createState() => _ProcductDeatilsScreenState();
}

class _ProcductDeatilsScreenState extends State<ProcductDeatilsScreen> {
  @override
  void initState() {
    context.read<ProductCubit>().productDetails(productId: widget.productId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details Screen "), centerTitle: true),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return switch (state) {
            ProductsDetailsLoadingstate() => Center(
              child: CircularProgressIndicator(),
            ),
            ProductsDetailsFailureState(:final message) => Text(message),
            ProductsDetailsSuccessState(:final details) => Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(details.coverPictureUrl ?? ""),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        details.name ?? "",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        details.description ?? "",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          details.price?.toString() ?? "",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: Text("Add To Cart"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _ => SizedBox.expand(),
          };
        },
      ),
    );
  }
}
