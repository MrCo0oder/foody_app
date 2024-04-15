import 'package:flutter/material.dart';
import 'package:foody_app/presentation/resources/color_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: Center(
            child: Text(
          "Login",
          style: Theme.of(context).textTheme.displayMedium,
        )));
  }
}
