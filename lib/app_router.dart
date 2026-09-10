import 'package:go_router/go_router.dart';
import 'package:ict_hub_flutter/home_screen.dart';
import 'package:ict_hub_flutter/image_picker_screen.dart';
import 'package:ict_hub_flutter/main_layout.dart';
import 'package:ict_hub_flutter/routes.dart';

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
    ],
  );
}
