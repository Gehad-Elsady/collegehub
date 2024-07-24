import 'package:collegehub/tabs/home-tab.dart';
import 'package:collegehub/tabs/message-tab.dart';
import 'package:collegehub/tabs/profile-tab.dart';
import 'package:collegehub/tabs/setting-tab.dart';
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

  List<Widget> tabs = const [
    HomeTab(),
    ProfileTab(),
    MessagTeab(),
    SettingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg.png",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
            title: Text(
              "Home Screen",
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff219EBC).withOpacity(0.5),
            elevation: 0,
          ),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blue.withOpacity(0.1),
            currentIndex: selectedIndex,
            selectedItemColor: Colors.yellow,
            unselectedItemColor: Colors.black,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_rounded), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_rounded), label: 'Messages'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
