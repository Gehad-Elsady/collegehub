import 'package:collegehub/Auth/auth-fire/auth_services.dart';
import 'package:collegehub/tabs/home-tab.dart';
import 'package:collegehub/tabs/message-tab.dart';
import 'package:collegehub/tabs/profile-tab.dart';
import 'package:collegehub/tabs/setting-tab.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    ProfileTab(),
    MessageTab(), // Fixed typo
    SettingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0XFFADB5BD),
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => AuthServices().signout(),
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                )),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
            title: Text(
              "app-bar".tr(),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'home-button'.tr()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_rounded),
                  label: 'profile-button'.tr()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_rounded),
                  label: 'message-button'.tr()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings-button'.tr()),
            ],
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
