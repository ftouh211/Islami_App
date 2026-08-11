import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/ahadeth/ahadeth_modle.dart';
import 'package:islami_app/home/details/hadeth_details.dart';

class AhadethTab extends StatefulWidget {
  static const String routeName = "AhadethTab";

  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<AhadethModle> allAhadeth = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadhadethFiles();

  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Image.asset("assets/images/hadith_header.png", height: 219),

          Divider(color: AppColors.PrimaryColor, thickness: 2),
          Text(
            "الحديث",
            style: GoogleFonts.elMessiri(
              fontSize: 24,
              fontWeight: FontWeight(700),
            ),
            textAlign: TextAlign.center,
          ),
          Divider(color: AppColors.PrimaryColor, thickness: 2),

          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Row(
                children: [
                  Expanded(
                    child: Icon(Icons.star, color: AppColors.PrimaryColor),
                  ),
                  Expanded(
                    flex: 2,
                    child: Divider(thickness: 2, color: AppColors.PrimaryColor),
                  ),
                  Expanded(
                    child: Icon(Icons.star, color: AppColors.PrimaryColor),
                  ),
                ],
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      arguments: AhadethModle(
                        allAhadeth[index].title,
                        allAhadeth[index].content,
                      ),
                      context,
                      HadethDetails.routeName,
                    );
                  },
                  child: Text(
                    allAhadeth[index].title,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight(700),
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              itemCount: allAhadeth.length,
            ),
          ),
        ],
      ),
    );
  }

  loadhadethFiles() {
    rootBundle.loadString("assets/quran/files/ahadeth.txt").then((value) {
      List<String> hadeth = value.split("#");

      for (int i = 0; i < hadeth.length; i++) {
        String hadethOne = hadeth[i];
        List<String> hadethLines = hadethOne.trim().split("\n");
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> content = hadethLines;

        AhadethModle ahadethModle = AhadethModle(title, content);

        allAhadeth.add(ahadethModle);

        setState(() {});
      }
    });
  }
}
