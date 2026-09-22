import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ict_hub_flutter/app/routes.dart';
import 'package:ict_hub_flutter/core/local_storage/base_local_storage.dart';
import 'package:ict_hub_flutter/injection_container.dart';
import 'package:ict_hub_flutter/presentation/cubit/categories/category_cubit.dart';
import 'package:ict_hub_flutter/presentation/cubit/products/product_cubit.dart';
import 'package:ict_hub_flutter/presentation/layout/main_layout.dart';
import 'package:ict_hub_flutter/presentation/screens/cart_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/favorit_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/home_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/image_picker_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/on_boarding_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/procduct_deatils_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/product_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: Routes.splashScreen,
        builder: (context, state) {
          return SplashScreen(localStorage: getIt<BaseLocalStorage>());
        },
      ),
      GoRoute(
        path: "/${Routes.onBoarding}",
        name: Routes.onBoarding,
        builder: (context, state) {
          return OnboardingScreen(localStorage: getIt<BaseLocalStorage>());
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

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/${Routes.homeScreen}",
                name: Routes.homeScreen,
                builder: (context, state) {
                  return HomeScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/${Routes.imagePickerScreen}",
                name: Routes.imagePickerScreen,
                builder: (context, state) {
                  return ImagePickerScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/${Routes.cartScreen}",
                name: Routes.cartScreen,
                builder: (context, state) {
                  return BlocProvider(
                    create: (context) => getIt<CategoryCubit>(),
                    child: CartScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/${Routes.favoriteScreen}",
                name: Routes.favoriteScreen,
                builder: (context, state) {
                  return FavoritScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
