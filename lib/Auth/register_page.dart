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
      backgroundColor: Color(0xffFCED4DA),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              ImageIcon(
                AssetImage("assets/images/student.png"),
                color: Color(0xff343A40),
                size: 150,
              ),
              SizedBox(height: 25),
              // message
              Text(
                "sign-up-title".tr(),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.black, fontSize: 20),
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
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "login-now".tr(),
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
