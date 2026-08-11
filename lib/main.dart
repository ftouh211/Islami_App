import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/home/details/hadeth_details.dart';
import 'package:islami_app/home/details/quran_details%20.dart';
import 'package:islami_app/splash_screen/splash_screen.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          SplashScreen.routeName: (context) => SplashScreen(),
          QuranDetails.routeName: (context) => QuranDetails(),
          HadethDetails.routeName: (context) => HadethDetails(),

        },
      ),
    );
  }
}

