import 'package:collegehub/Auth/login_page.dart';
import 'package:collegehub/Auth/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  static const String routName = "registerPage";

  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void toggelPage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        ontap: toggelPage,
      );
    } else {
      return RegisterPage(onTap: toggelPage);
    }
  }
}
