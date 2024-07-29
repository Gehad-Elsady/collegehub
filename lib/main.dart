import 'package:collegehub/Auth/auth-fire/auth-gete.dart';
import 'package:collegehub/firebase_options.dart';
import 'package:collegehub/screens/college-screen.dart';
import 'package:collegehub/screens/home-screen.dart';
import 'package:collegehub/screens/message-screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      saveLocale: true,
      startLocale: const Locale("en"),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        initialRoute: AuthGete.routName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          CollegeScreen.routeName: (context) => const CollegeScreen(),
          MessageScreen.routeName: (context) => const MessageScreen(),
          AuthGete.routName: (context) => const AuthGete(),
        });
  }
}
