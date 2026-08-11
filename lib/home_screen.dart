import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/ahadeth_screen.dart';
import 'package:islami_app/home/quran_screen.dart';
import 'package:islami_app/home/radio_screen.dart';
import 'package:islami_app/home/sepha_screen.dart';
import 'package:islami_app/home/settings_screen.dart';
import 'package:islami_app/splash_screen/custom_bottom_nav_item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SephaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/main_bg.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,

            centerTitle: true,
            title: Text(
              "Islami",
              style: GoogleFonts.elMessiri(
                fontSize: 30,
                fontWeight: FontWeight(700),
              ),
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            currentIndex: selectedIndex,
            backgroundColor: Color(0xffB7935F),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              selectedIndex = index;

              setState(() {});
            },

            items: [
              CustomBottomNavItem(
                label: "Quran",
                imagePath: "assets/images/quran_icn.png",
              ).toBottomNavigationBarItem(),

              CustomBottomNavItem(
                label: "Ahadeth",
                imagePath: "assets/images/ahadeth.png",
              ).toBottomNavigationBarItem(),
              CustomBottomNavItem(
                label: "Sepha",
                imagePath: "assets/images/sebha_blue.png",
              ).toBottomNavigationBarItem(),
              CustomBottomNavItem(
                label: "Radio",
                imagePath: "assets/images/radio_blue.png",
              ).toBottomNavigationBarItem(),

              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Setting",
              ),
            ],
          ),

          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
