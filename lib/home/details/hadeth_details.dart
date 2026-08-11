import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/ahadeth/ahadeth_modle.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "HadethDetails";
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  late var model = ModalRoute.of(context)?.settings.arguments as AhadethModle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/main_bg.png")),
      ),
      child: Scaffold(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsGeometry.directional(
                  top: 10,
                  bottom: 50,
                  end: 10,
                  start: 10,
                ),
                child: Card(
                  color: Colors.white.withValues(alpha: 0.8),

                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Text(model.title, style: GoogleFonts.elMessiri(
                        fontSize: 22,
                        fontWeight: FontWeight(700),
                      ),),
                      Divider(color: AppColors.PrimaryColor, thickness: 2,endIndent: 30,indent: 30,),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: model.content.length,
                            itemBuilder: (context, index) {
                              return Text(
                                textDirection: TextDirection.rtl,
                                // maxLines: 1,
                                textAlign: TextAlign.center,
                                model.content[index],
                                style: GoogleFonts.inter(
                                  fontSize: 22,
                                  fontWeight: FontWeight(500),
                                  height: 1.8,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
