import 'package:collegehub/Auth/auth-fire/login_or_register.dart';
import 'package:collegehub/screens/home-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGete extends StatelessWidget {
  static const String routName = "authPage";

  const AuthGete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return HomeScreen();
          } else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
