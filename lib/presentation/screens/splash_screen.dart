import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ict_hub_flutter/app/routes.dart';
import 'package:ict_hub_flutter/core/constant/local_keys.dart';
import 'package:ict_hub_flutter/core/local_storage/base_local_storage.dart';
import 'package:ict_hub_flutter/core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this._localStorage});

  final BaseLocalStorage _localStorage;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigate() async {
    final bool? isOpen = await widget._localStorage.getBool(LocalKeys.isOpen);
    //final String? token = await widget._localStorage.getBool(LocalKeys.isOpen);

    Future.delayed(Duration(seconds: 2), () {
      if (isOpen == null) {
        context.pushNamed(Routes.onBoarding);
      } else {
        context.pushNamed(Routes.homeScreen);
        // if (token == null) {
        //   context.pushNamed(Routes.loginScreen);
        // } else {
        //   context.pushNamed(Routes.mainLayout);
        // }
      }
    });
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(AppAssets.splash)));
  }
}
