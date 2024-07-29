import 'package:collegehub/Auth/auth-fire/auth_services.dart';
import 'package:collegehub/Components/my_button.dart';
import 'package:collegehub/Components/my_textfilde.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    final _authService = AuthServices();

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await _authService.signupWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "password-error".tr(),
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.lock_open_rounded,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              SizedBox(height: 25),
              // message
              Text(
                "sign-up-title".tr(),
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              // email
              MyTextFilde(
                emailController,
                "email".tr(),
                false,
                Icon(Icons.email_outlined),
              ),
              SizedBox(height: 15),
              // password
              MyTextFilde(
                passwordController,
                "password".tr(),
                true,
                Icon(Icons.key_rounded),
              ),
              SizedBox(height: 15),
              // confirm password
              MyTextFilde(
                confirmPasswordController,
                "c-password".tr(),
                true,
                Icon(Icons.password_rounded),
              ),
              SizedBox(height: 25),
              // sign up button
              MyButton(ontap: register, "sign-up".tr(), icon: Icons.login),
              SizedBox(height: 8),
              // sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "have-account".tr(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "login-now".tr(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
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
