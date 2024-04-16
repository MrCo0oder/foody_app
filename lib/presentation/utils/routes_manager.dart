
import 'package:flutter/material.dart';
import 'package:foody_app/presentation/utils/strings_manager.dart';

import '../forgot_password/forgot_password_view.dart';
import '../login/login_view.dart';
import '../main/main_view.dart';
import '../onboarding/onboarding_view.dart';
import '../register/register_view.dart';
import '../splash/splash_view.dart';
import '../store_details/store_details_view.dart';
import 'color_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String onBoardingRoute = "/onBoarding";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
                elevation: 1,
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close_rounded,
                      size: 25.0,
                      color: ColorManager.error,
                    ),
                    const Text(
                      AppStrings.noRouteFound,
                    ),
                  ],
                ),
              ),
            ));
  }
}
