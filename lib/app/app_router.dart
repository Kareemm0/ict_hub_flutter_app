import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ict_hub_flutter/app/routes.dart';
import 'package:ict_hub_flutter/injection_container.dart';
import 'package:ict_hub_flutter/presentation/cubit/products/product_cubit.dart';
import 'package:ict_hub_flutter/presentation/layout/main_layout.dart';
import 'package:ict_hub_flutter/presentation/screens/home_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/image_picker_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/procduct_deatils_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/product_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: Routes.mainLayout,
        builder: (context, state) {
          return MainLayout();
        },
      ),
      GoRoute(
        path: "/${Routes.homeScreen}",
        name: Routes.homeScreen,
        builder: (context, state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: "/${Routes.imagePickerScreen}",
        name: Routes.imagePickerScreen,
        builder: (context, state) {
          return ImagePickerScreen();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => getIt<ProductCubit>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: "/${Routes.productScreen}",
            name: Routes.productScreen,
            builder: (context, state) {
              final String? title = state.uri.queryParameters['title'];
              return ProductScreen(title: title ?? "");
            },
          ),
          GoRoute(
            path: "/${Routes.productDetailsScreen}",
            name: Routes.productDetailsScreen,
            builder: (context, state) {
              final String? id = state.uri.queryParameters['id'];
              return ProcductDeatilsScreen(productId: id ?? "");
            },
          ),
        ],
      ),
    ],
  );
}
