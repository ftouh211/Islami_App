import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(
      const Duration(seconds: 3),
          () {

        Navigator.pushReplacementNamed(
          context,
          HomeScreen.routeName,
        );

      },
    );  }




  @override

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset("assets/images/splash.png", fit: BoxFit.cover),
        ),

        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset("assets/images/logo2.png")),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/routelogo2.png.png",
                              fit: BoxFit.contain,
                              width: 139.w,
                              height: 139.h,
                            ),

                            Positioned(
                              bottom: 5,
                              child: Text(
                                "Supervised by Ftouh Abdelsamed",
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFC0A060),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
