import 'package:flutter/material.dart';
import 'package:foody_app/presentation/resources/assets_manager.dart';
import 'package:foody_app/presentation/resources/color_manager.dart';
import 'package:foody_app/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
   const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
   // var theme = Theme.of(context);
   var size = MediaQuery.of(context).size;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
    });
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(
          AssetsManager.splashLogo,
          width: (size.height > size.width)
              ? size.width * 0.4
              : size.height * 0.4,
          height: (size.height > size.width)
              ? size.width * 0.4
              : size.height * 0.4,
        ),
      ),
    );
  }
}
