import 'package:collegehub/Auth/auth-fire/auth_services.dart';
import 'package:collegehub/Components/my_button.dart';
import 'package:collegehub/Components/my_textfilde.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? ontap;
  static const String routName = "loginPage";

  const LoginPage({super.key, required this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  void login() async {
    final _authService = AuthServices();
    try {
      await _authService.signinWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      String errorMessage = "error-login".tr();
      if (e is FirebaseAuthException) {
        if (e.code == "wrong-password") {
          errorMessage = "error-pass".tr();
        }
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(errorMessage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCED4DA),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageIcon(
                AssetImage("assets/images/login-logo.png"),
                size: 400,
                color: Color(0xff495057),
              ),
              Text(
                textAlign: TextAlign.center,
                "login-title".tr(),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 25,
              ),
              //email
              MyTextFilde(emailController, "email".tr(), false,
                  Icon(Icons.email_outlined)),
              SizedBox(height: 15),
              //password
              MyTextFilde(passwordController, "password".tr(), true,
                  Icon(Icons.key_rounded)),
              SizedBox(height: 25),
              //sing in
              MyButton(ontap: login, "sign-in".tr(), icon: Icons.login),
              SizedBox(height: 8),
              //sing up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "not-m".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: widget.ontap,
                    child: Text(
                      "register-now".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
