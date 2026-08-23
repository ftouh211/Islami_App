import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_colors.dart';

class SephaTab extends StatefulWidget {
  const SephaTab({super.key});

  @override
  State<SephaTab> createState() => _SephaTabState();
}

class _SephaTabState extends State<SephaTab> {
  List<String> aldhdhakar = ["praise_god".tr(), "thank_god".tr(), "god_is_the_greatest".tr()];
  int index = 0;
  int number_aldhdhakar = 1;
  double rotation = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          // color: Colors.red,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 0,
                left: 170,
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? "assets/images/dark head of seb7a.png"
                      : "assets/images/head of seb7a.png",
                  height: 120,
                  width: 150,
                ),
              ),

              // InkWell(
              //   onTap: onSebhaTap,
              //   child: Transform.rotate(
              //     angle: rotation,
              //     child: Image.asset(
              //       "assets/images/body of seb7a.png",
              //       height: 400,
              //       width: 320,
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: onSebhaTap,
                child: Transform.rotate(
                  angle: rotation,
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? "assets/images/dark body of seb7a.png"
                        : "assets/images/body of seb7a.png",                    height: 400,
                    width: 320,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          "number_of_tasbeehs".tr(),
          style: GoogleFonts.elMessiri(
            fontSize: 24,
            fontWeight: FontWeight(700),
            color: Theme.of(context).colorScheme.onSurface,
          ),

          textAlign: TextAlign.center,
        ),
        // Center(
        //   child: SizedBox(
        //     width: 130,
        //     height: 80,
        //     child: ElevatedButton(
        //       onPressed: () {},
        //
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: AppColors.PrimaryColor,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(20),
        //         ),
        //       ),
        //
        //       child: Text(
        //         "50",
        //         style: GoogleFonts.elMessiri(
        //           fontSize: 24,
        //           fontWeight: FontWeight(700),
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(height: 20),
        Center(
          child: Container(
            width: 80,
            height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                "$number_aldhdhakar",
                style: GoogleFonts.elMessiri(
                  fontSize: 24,
                  fontWeight: FontWeight(700),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Container(
            width: 250,
            height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                aldhdhakar[index],
                style: GoogleFonts.elMessiri(
                  fontSize: 24,
                  fontWeight: FontWeight(700),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onSebhaTap() {
    setState(() {
      rotation += 0.15;

      number_aldhdhakar++;

      if (number_aldhdhakar > 33) {
        number_aldhdhakar = 1;

        index++;

        if (index >= aldhdhakar.length) {
          index = 0;
        }
      }
    });
  }
}
