import 'package:flutter/material.dart';

class MyTextFilde extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;
  const MyTextFilde(this.controller, this.hintText, this.obscureText, this.icon,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
              borderRadius: BorderRadius.circular(30.0)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(30.0)),
          hintText: hintText,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
