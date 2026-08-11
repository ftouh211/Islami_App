// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:islami_app/app_colors.dart';
//
// class QuranTab extends StatefulWidget {
//   const QuranTab({super.key});
//
//   @override
//   State<QuranTab> createState() => _QuranTabState();
// }
//
// class _QuranTabState extends State<QuranTab> {
//   List<String> suraNames = [
//     "الفاتحه",
//     "البقرة",
//     "آل عمران",
//     "النساء",
//     "المائدة",
//     "الأنعام",
//     "الأعراف",
//     "الأنفال",
//     "التوبة",
//     "يونس",
//     "هود",
//     "يوسف",
//     "الرعد",
//     "إبراهيم",
//     "الحجر",
//     "النحل",
//     "الإسراء",
//     "الكهف",
//     "مريم",
//     "طه",
//     "الأنبياء",
//     "الحج",
//     "المؤمنون",
//     "النّور",
//     "الفرقان",
//     "الشعراء",
//     "النّمل",
//     "القصص",
//     "العنكبوت",
//     "الرّوم",
//     "لقمان",
//     "السجدة",
//     "الأحزاب",
//     "سبأ",
//     "فاطر",
//     "يس",
//     "الصافات",
//     "ص",
//     "الزمر",
//     "غافر",
//     "فصّلت",
//     "الشورى",
//     "الزخرف",
//     "الدّخان",
//     "الجاثية",
//     "الأحقاف",
//     "محمد",
//     "الفتح",
//     "الحجرات",
//     "ق",
//     "الذاريات",
//     "الطور",
//     "النجم",
//     "القمر",
//     "الرحمن",
//     "الواقعة",
//     "الحديد",
//     "المجادلة",
//     "الحشر",
//     "الممتحنة",
//     "الصف",
//     "الجمعة",
//     "المنافقون",
//     "التغابن",
//     "الطلاق",
//     "التحريم",
//     "الملك",
//     "القلم",
//     "الحاقة",
//     "المعارج",
//     "نوح",
//     "الجن",
//     "المزّمّل",
//     "المدّثر",
//     "القيامة",
//     "الإنسان",
//     "المرسلات",
//     "النبأ",
//     "النازعات",
//     "عبس",
//     "التكوير",
//     "الإنفطار",
//     "المطفّفين",
//     "الإنشقاق",
//     "البروج",
//     "الطارق",
//     "الأعلى",
//     "الغاشية",
//     "الفجر",
//     "البلد",
//     "الشمس",
//     "الليل",
//     "الضحى",
//     "الشرح",
//     "التين",
//     "العلق",
//     "القدر",
//     "البينة",
//     "الزلزلة",
//     "العاديات",
//     "القارعة",
//     "التكاثر",
//     "العصر",
//     "الهمزة",
//     "الفيل",
//     "قريش",
//     "الماعون",
//     "الكوثر",
//     "الكافرون",
//     "النصر",
//     "المسد",
//     "الإخلاص",
//     "الفلق",
//     "الناس",
//   ];
//   List<int> versesNumber = [
//     7,
//     286,
//     200,
//     176,
//     120,
//     165,
//     206,
//     75,
//     129,
//     109,
//     123,
//     111,
//     43,
//     52,
//     99,
//     128,
//     111,
//     110,
//     98,
//     135,
//     112,
//     78,
//     118,
//     64,
//     77,
//     227,
//     93,
//     88,
//     69,
//     60,
//     34,
//     30,
//     73,
//     54,
//     45,
//     83,
//     182,
//     88,
//     75,
//     85,
//     54,
//     53,
//     89,
//     59,
//     37,
//     35,
//     38,
//     29,
//     18,
//     45,
//     60,
//     49,
//     62,
//     55,
//     78,
//     96,
//     29,
//     22,
//     24,
//     13,
//     14,
//     11,
//     11,
//     18,
//     12,
//     12,
//     30,
//     52,
//     52,
//     44,
//     28,
//     28,
//     20,
//     56,
//     40,
//     31,
//     50,
//     40,
//     46,
//     42,
//     29,
//     19,
//     36,
//     25,
//     22,
//     17,
//     19,
//     26,
//     30,
//     20,
//     15,
//     21,
//     11,
//     8,
//     5,
//     19,
//     5,
//     8,
//     8,
//     11,
//     11,
//     8,
//     3,
//     9,
//     5,
//     4,
//     6,
//     3,
//     6,
//     3,
//     5,
//     4,
//     5,
//     6,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Image.asset("assets/images/quran_header_icn.png", height: 240),
//         Divider(color: AppColors.PrimaryColor, thickness: 3),
//         SizedBox(
//           height: 40,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 // flex: 4,
//                 child: Text(
//                   "Sura Name",
//                   style: GoogleFonts.elMessiri(
//                     fontSize: 20,
//                     fontWeight: FontWeight(700),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//
//               Expanded(
//                 flex: 0,
//                 child: VerticalDivider(
//                   thickness: 2,
//                   color: AppColors.PrimaryColor,
//                 ),
//               ),
//               Expanded(
//                 // flex: 4,
//                 child: Text(
//                   "Numbers Verses",
//                   style: GoogleFonts.elMessiri(
//                     fontSize: 18,
//                     fontWeight: FontWeight(700),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(color: AppColors.PrimaryColor, thickness: 3),
//
//         Expanded(
//           child: SizedBox(
//             height: double.infinity,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ListView.separated(
//                     separatorBuilder: (context, index) =>
//                         Divider(thickness: 2, color: AppColors.PrimaryColor),
//                     itemBuilder: (context, index) {
//                       return Center(
//                         child: Text(
//                           suraNames[index],
//                           style: GoogleFonts.elMessiri(
//                             fontSize: 20,
//                             fontWeight: FontWeight(700),
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: suraNames.length,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 0,
//                   child: VerticalDivider(
//                     thickness: 2,
//                     color: AppColors.PrimaryColor,
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.separated(
//                     separatorBuilder: (context, index) =>
//                         Divider(thickness: 2, color: AppColors.PrimaryColor),
//                     itemBuilder: (context, index) {
//                       return Center(
//                         child: Text(
//                           versesNumber[index].toString() ,
//                           style: GoogleFonts.elMessiri(
//                             fontSize: 20,
//                             fontWeight: FontWeight(700),
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: versesNumber.length,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:islami_app/app_colors.dart';
// //
// // class QuranTab extends StatefulWidget {
// //   const QuranTab({super.key});
// //
// //   @override
// //   State<QuranTab> createState() => _QuranTabState();
// // }
// //
// // class _QuranTabState extends State<QuranTab> {
// //   List<String> suraNames = [
// //     "الفاتحه", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام",
// //     "الأعراف", "الأنفال", "التوبة", "يونس", "هود", "يوسف", "الرعد",
// //     "إبراهيم", "الحجر", "النحل", "الإسراء", "الكهف", "مريم", "طه",
// //     "الأنبياء", "الحج", "المؤمنون", "النّور", "الفرقان", "الشعراء",
// //     "النّمل", "القصص", "العنكبوت", "الرّوم", "لقمان", "السجدة",
// //     "الأحزاب", "سبأ", "فاطر", "يس", "الصافات", "ص", "الزمر", "غافر",
// //     "فصّلت", "الشورى", "الزخرف", "الدّخان", "الجاثية", "الأحقاف",
// //     "محمد", "الفتح", "الحجرات", "ق", "الذاريات", "الطور", "النجم",
// //     "القمر", "الرحمن", "الواقعة", "الحديد", "المجادلة", "الحشر",
// //     "الممتحنة", "الصف", "الجمعة", "المنافقون", "التغابن", "الطلاق",
// //     "التحريم", "الملك", "القلم", "الحاقة", "المعارج", "نوح", "الجن",
// //     "المزّمّل", "المدّثر", "القيامة", "الإنسان", "المرسلات", "النبأ",
// //     "النازعات", "عبس", "التكوير", "الإنفطار", "المطفّفين", "الإنشقاق",
// //     "البروج", "الطارق", "الأعلى", "الغاشية", "الفجر", "البلد",
// //     "الشمس", "الليل", "الضحى", "الشرح", "التين", "العلق", "القدر",
// //     "البينة", "الزلزلة", "العاديات", "القارعة", "التكاثر", "العصر",
// //     "الهمزة", "الفيل", "قريش", "الماعون", "الكوثر", "الكافرون",
// //     "النصر", "المسد", "الإخلاص", "الفلق", "الناس",
// //   ];
// //
// //   List<int> versesNumber = [
// //     7, 286, 200, 176, 120, 165, 206, 75, 129, 109, 123, 111, 43, 52,
// //     99, 128, 111, 110, 98, 135, 112, 78, 118, 64, 77, 227, 93, 88, 69,
// //     60, 34, 30, 73, 54, 45, 83, 182, 88, 75, 85, 54, 53, 89, 59, 37,
// //     35, 38, 29, 18, 45, 60, 49, 62, 55, 78, 96, 29, 22, 24, 13, 14,
// //     11, 11, 18, 12, 12, 30, 52, 52, 44, 28, 28, 20, 56, 40, 31, 50,
// //     40, 46, 42, 29, 19, 36, 25, 22, 17, 19, 26, 30, 20, 15, 21, 11,
// //     8, 5, 19, 5, 8, 8, 11, 11, 8, 3, 9, 5, 4, 6, 3, 6, 3, 5, 4, 5, 6,
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Directionality(
// //       textDirection: TextDirection.rtl,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.stretch,
// //         children: [
// //           Image.asset("assets/images/quran_header_icn.png", height: 240),
// //           Divider(color: AppColors.PrimaryColor, thickness: 3, height: 1),
// //           Row(
// //             children: [
// //               Expanded(
// //                 child: Text(
// //                   "عدد الآيات",
// //                   textAlign: TextAlign.center,
// //                   style: GoogleFonts.elMessiri(
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                     // decoration: TextDecoration.underline,
// //                     decorationColor: AppColors.PrimaryColor,
// //                   ),
// //                 ),
// //               ),
// //               Container(width: 1.5, height: 50, color: AppColors.PrimaryColor),
// //               Expanded(
// //                 child: Text(
// //                   "إسم السورة",
// //                   textAlign: TextAlign.center,
// //                   style: GoogleFonts.elMessiri(
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                     // decoration: TextDecoration.underline,
// //                     decorationColor: AppColors.PrimaryColor,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Divider(color: AppColors.PrimaryColor, thickness: 3, height: 1),
// //           Expanded(
// //             child: ListView.separated(
// //               itemCount: suraNames.length,
// //               separatorBuilder: (context, index) => Divider(
// //                 thickness: 3,
// //                 height: 1,
// //                 color: AppColors.PrimaryColor,
// //               ),
// //               itemBuilder: (context, index) {
// //                 return SizedBox(
// //                   height: 40,
// //                   child: InkWell(
// //                     onTap: () {
// //
// //                     },
// //                     child: Row(
// //                       children: [
// //                         Expanded(
// //                           child: Center(
// //                             child: Text(
// //                               versesNumber[index].toString(),
// //                               style: GoogleFonts.elMessiri(
// //                                 fontSize: 18,
// //                                 fontWeight: FontWeight.w600,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         Container(
// //                           width: 1,
// //                           height: 30,
// //                           color: AppColors.PrimaryColor.withOpacity(0.5),
// //                         ),
// //                         Expanded(
// //                           child: Center(
// //                             child: Text(
// //                               suraNames[index],
// //                               style: GoogleFonts.elMessiri(
// //                                 fontSize: 18,
// //                                 fontWeight: FontWeight.w600,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/details/quran_details%20.dart';
import 'package:islami_app/quran/modles/sura_model.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس",
  ];

  List<int> versesNumber = [
    7,
    286,
    200,
    176,
    120,
    165,
    206,
    75,
    129,
    109,
    123,
    111,
    43,
    52,
    99,
    128,
    111,
    110,
    98,
    135,
    112,
    78,
    118,
    64,
    77,
    227,
    93,
    88,
    69,
    60,
    34,
    30,
    73,
    54,
    45,
    83,
    182,
    88,
    75,
    85,
    54,
    53,
    89,
    59,
    37,
    35,
    38,
    29,
    18,
    45,
    60,
    49,
    62,
    55,
    78,
    96,
    29,
    22,
    24,
    13,
    14,
    11,
    11,
    18,
    12,
    12,
    30,
    52,
    52,
    44,
    28,
    28,
    20,
    56,
    40,
    31,
    50,
    40,
    46,
    42,
    29,
    19,
    36,
    25,
    22,
    17,
    19,
    26,
    30,
    20,
    15,
    21,
    11,
    8,
    5,
    19,
    5,
    8,
    8,
    11,
    11,
    8,
    3,
    9,
    5,
    4,
    6,
    3,
    6,
    3,
    5,
    4,
    5,
    6,
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/quran_header_icn.png", height: 220),
          Divider(color: AppColors.PrimaryColor, thickness: 3, height: 1),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "عدد الآيات",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.elMessiri(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decorationColor: AppColors.PrimaryColor,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: VerticalDivider(
                    thickness: 2,
                    color: AppColors.PrimaryColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    "إسم السورة",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.elMessiri(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decorationColor: AppColors.PrimaryColor,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.PrimaryColor, thickness: 3, height: 1),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {});
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const AhadethTab(),
                //   ),
                // );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => QuranDetails(
                //       surahNumber: 2,
                //     ),
                //   ),
                // );



                // Navigator.pushNamed(
                //   arguments: SuraModel(suraNames[index], index),
                //   context,
                //   QuranDetails.routeName,
                // );
              },
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder(
                    // horizontalInside: BorderSide(
                    //   color: AppColors.PrimaryColor,
                    //   width: 2,
                    // ),
                    verticalInside: BorderSide(
                      color: AppColors.PrimaryColor,
                      width: 2,
                    ),
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                  },
                  children: List.generate(suraNames.length, (index) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const AhadethTab(),
                              //   ),
                              // );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => QuranDetails(
                              //       surahNumber: 2,
                              //     ),
                              //   ),
                              // );



                              // Navigator.pushNamed(
                              //   arguments: SuraModel(suraNames[index], index),
                              //   context,
                              //   QuranDetails.routeName,
                              // );

                              Navigator.pushNamed(
                                context,
                                QuranDetails.routeName,
                                arguments: SuraModel(
                                  suraNames[index],
                                  index,
                                ),
                              );
                            },

                            child: Text(
                              versesNumber[index].toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.elMessiri(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const AhadethTab(),
                              //   ),
                              // );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => QuranDetails(
                              //       surahNumber: 2,
                              //     ),
                              //   ),
                              // );


                              //
                              // Navigator.pushNamed(
                              //   arguments: SuraModel(suraNames[index], index),
                              //   context,
                              //   QuranDetails.routeName,
                              // );

                              Navigator.pushNamed(
                                context,
                                QuranDetails.routeName,
                                arguments: SuraModel(
                                  suraNames[index],
                                  index,
                                ),
                              );
                            },


                            child: Text(
                              suraNames[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.elMessiri(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
