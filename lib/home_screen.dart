import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/navigation_bottem_screen/ahadeth_screen.dart';
import 'package:islami_app/home/navigation_bottem_screen/quran_screen.dart';
import 'package:islami_app/home/navigation_bottem_screen/radio_screen.dart';
import 'package:islami_app/home/navigation_bottem_screen/sepha_screen.dart';
import 'package:islami_app/home/navigation_bottem_screen/settings_screen.dart';

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
        Image.asset(
          Theme.of(context).brightness == Brightness.dark
              ? "assets/images/dark_main_bg.png"
              : "assets/images/main_bg.png",
          fit: BoxFit.cover,
        ),
        // Image.asset("assets/images/main_bg.png"),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "islami".tr(),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              CustomBottomNavItem(
                label: "quran".tr(),
                imagePath: "assets/images/quran_icn.png",
              ).toBottomNavigationBarItem(),

              CustomBottomNavItem(
                label: "ahadeth".tr(),
                imagePath: "assets/images/ahadeth.png",
              ).toBottomNavigationBarItem(),
              CustomBottomNavItem(
                label: "sepha".tr(),
                imagePath: "assets/images/sebha_blue.png",
              ).toBottomNavigationBarItem(),
              CustomBottomNavItem(
                label: "radio".tr(),
                imagePath: "assets/images/radio_blue.png",
              ).toBottomNavigationBarItem(),

              BottomNavigationBarItem(

                icon: Icon(Icons.settings),
                label: "setting".tr(),
              ),
            ],
          ),

          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
