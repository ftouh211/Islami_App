// // // import 'package:flutter/material.dart';
// // // import 'package:islami_app/home/api_models/api_manager.dart';
// // // import 'package:islami_app/home/api_models/surah_details_model.dart';
// // //
// // //
// // // class QuranDetails extends StatefulWidget {
// // //   final int surahNumber;
// // //
// // //   const QuranDetails({
// // //     super.key,
// // //     required this.surahNumber,
// // //   });
// // //
// // //   @override
// // //   State<QuranDetails> createState() => _QuranDetailsState();
// // // }
// // //
// // // class _QuranDetailsState extends State<QuranDetails> {
// // //   late Future<SurahDetailsModel> surahFuture;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //
// // //     surahFuture = ApiManager.getSurah(widget.surahNumber);
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       // appBar: AppBar(
// // //       //   title: const Text('القرآن الكريم'),
// // //       //   centerTitle: true,
// // //       // ),
// // //
// // //       body: FutureBuilder<SurahDetailsModel>(
// // //         future: surahFuture,
// // //
// // //         builder: (context, snapshot) {
// // //
// // //           // Loading
// // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // //             return const Center(
// // //               child: CircularProgressIndicator(),
// // //             );
// // //           }
// // //
// // //           // Error
// // //           if (snapshot.hasError) {
// // //             return Center(
// // //               child: Text(
// // //                 'حدث خطأ أثناء تحميل السورة\n${snapshot.error}',
// // //                 textAlign: TextAlign.center,
// // //               ),
// // //             );
// // //           }
// // //
// // //           // No data
// // //           if (!snapshot.hasData) {
// // //             return const Center(
// // //               child: Text('لا توجد بيانات'),
// // //             );
// // //           }
// // //
// // //           final surah = snapshot.data!;
// // //
// // //           return Column(
// // //             children: [
// // //
// // //               // اسم السورة
// // //               Padding(
// // //                 padding: const EdgeInsets.all(16),
// // //                 child: Text(
// // //                   surah.name,
// // //                   textDirection: TextDirection.rtl,
// // //                   style: const TextStyle(
// // //                     fontSize: 25,
// // //                     fontWeight: FontWeight.bold,
// // //                   ),
// // //                 ),
// // //               ),
// // //
// // //               // الآيات
// // //               // Expanded(
// // //               //   child: ListView.builder(
// // //               //     padding: const EdgeInsets.symmetric(
// // //               //       horizontal: 20,
// // //               //       vertical: 10,
// // //               //     ),
// // //               //     itemCount: surah.ayahs.length,
// // //               //     itemBuilder: (context, index) {
// // //               //
// // //               //       final ayah = surah.ayahs[index];
// // //               //
// // //               //       return Padding(
// // //               //         padding: const EdgeInsets.only(
// // //               //           bottom: 18,
// // //               //         ),
// // //               //
// // //               //         child: Text(
// // //               //           '${ayah.text} ﴿${ayah.numberInSurah}﴾',
// // //               //
// // //               //           textDirection: TextDirection.rtl,
// // //               //
// // //               //           textAlign: TextAlign.center,
// // //               //
// // //               //           style: const TextStyle(
// // //               //             fontSize: 25,
// // //               //             height: 2,
// // //               //           ),
// // //               //         ),
// // //               //       );
// // //               //     },
// // //               //   ),
// // //               // ),
// // //
// // //               Expanded(
// // //                 child: Container(
// // //                   width: double.infinity,
// // //                   color: const Color(0xffFFF9E8),
// // //                   child: SingleChildScrollView(
// // //                     padding: const EdgeInsets.symmetric(
// // //                       horizontal: 3,
// // //                       vertical: 0,
// // //                     ),
// // //                     child: RichText(
// // //                       textDirection: TextDirection.rtl,
// // //                       textAlign: TextAlign.center,
// // //                       text: TextSpan(
// // //                         children: surah.ayahs.map((ayah) {
// // //                           return TextSpan(
// // //                             text: '${ayah.text} ',
// // //                             style: const TextStyle(
// // //                               fontFamily: 'Quran',
// // //                               fontSize: 27,
// // //                               height: 2.2,
// // //                               color: Color(0xff1E1E1E),
// // //                             ),
// // //                           );
// // //                         }).toList(),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }
// // // //
// //
// // import 'package:flutter/material.dart';
// // import 'package:islami_app/home/sura_model.dart';
// // import 'package:islami_app/quran/modles/quran_page_model.dart';
// // import 'package:islami_app/quran/services/quran_asset_service.dart';
// // import 'package:islami_app/quran/services/quran_font_service.dart';
// // import 'package:islami_app/quran/widgets/quran_page.dart';
// //
// // class QuranDetails extends StatefulWidget {
// //   static const String routeName = "QuranDetails";
// //
// //   const QuranDetails({super.key});
// //
// //   @override
// //   State<QuranDetails> createState() => _QuranDetailsState();
// // }
// //
// // class _QuranDetailsState extends State<QuranDetails> {
// //   late SuraModel model;
// //
// //   QuranPageModel? page;
// //   String? fontFamily;
// //
// //   bool isLoading = true;
// //
// //   @override
// //   void didChangeDependencies() {
// //     super.didChangeDependencies();
// //
// //     model = ModalRoute.of(context)!.settings.arguments as SuraModel;
// //
// //     loadQuranPage();
// //   }
// //
// //   Future<void> loadQuranPage() async {
// //     try {
// //       // مؤقتًا هنختبر الصفحة الأولى
// //       final loadedPage = await QuranAssetService.loadPage(5);
// //
// //       final loadedFont = await QuranFontService.loadPageFont(5);
// //
// //       if (!mounted) return;
// //
// //       setState(() {
// //         page = loadedPage;
// //         fontFamily = loadedFont;
// //         isLoading = false;
// //       });
// //     } catch (e) {
// //       debugPrint('Quran Error: $e');
// //
// //       if (!mounted) return;
// //
// //       setState(() {
// //         isLoading = false;
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     if (isLoading) {
// //       return const Scaffold(body: Center(child: CircularProgressIndicator()));
// //     }
// //
// //     if (page == null || fontFamily == null) {
// //       return const Scaffold(
// //         body: Center(child: Text('حدث خطأ في تحميل القرآن')),
// //       );
// //     }
// //
// //     return Scaffold(
// //       backgroundColor: const Color(0xffFFF9E8),
// //
// //       body: SafeArea(
// //         child: Center(child: QuranPage(page: page!, fontFamily: fontFamily!)),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'package:islami_app/quran/modles/quran_page_model.dart';
// import 'package:islami_app/quran/modles/sura_model.dart';
// import 'package:islami_app/quran/services/quran_asset_service.dart';
// import 'package:islami_app/quran/services/quran_font_service.dart';
// import 'package:islami_app/quran/widgets/quran_page.dart';
//
// class QuranDetails extends StatefulWidget {
//   static const String routeName = "QuranDetails";
//
//   const QuranDetails({
//     super.key,
//   });
//
//   @override
//   State<QuranDetails> createState() => _QuranDetailsState();
// }
//
// class _QuranDetailsState extends State<QuranDetails> {
//
//   late SuraModel model;
//
//   late PageController pageController;
//
//   int? firstPage;
//
//   late String currentSurahName = model.name;
//
//   bool isLoading = true;
//
//   bool _loadedArguments = false;
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
//
//
//   Future<String?> getSurahNameForPage(int pageNumber) async {
//     for (int page = pageNumber; page >= 1; page--) {
//       final quranPage = await QuranAssetService.loadPage(page);
//
//       for (final line in quranPage.lines) {
//         if (line.type == 'surah-header' && line.surah != null) {
//           final surahNumber = int.parse(line.surah!);
//
//           final index = surahNumber - 1;
//
//           if (index >= 0 && index < suraNames.length) {
//             return suraNames[index];
//           }
//         }
//       }
//     }
//
//     return null;
//   }
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//
//     if (_loadedArguments) {
//       return;
//     }
//
//     _loadedArguments = true;
//
//     model = ModalRoute.of(context)!.settings.arguments as SuraModel;
//
//     loadQuran();
//   }
//
//   Future<void> loadQuran() async {
//     try {
//
//       // index عندك يبدأ من 0
//       // القرآن يبدأ من 1
//       final surahNumber = model.index + 1;
//
//       final page = await QuranAssetService.findSurahPage(
//         surahNumber,
//       );
//
//       if (!mounted) return;
//
//       pageController = PageController(
//         initialPage: page - 1,
//       );
//
//       setState(() {
//         firstPage = page;
//         isLoading = false;
//       });
//
//     } catch (e) {
//
//       debugPrint(
//         'Quran Error: $e',
//       );
//
//       if (!mounted) return;
//
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     if (!isLoading) {
//       pageController.dispose();
//     }
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     if (isLoading) {
//       return Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage("assets/images/main_bg.png")),
//         ),
//         child: const Scaffold(
//           // backgroundColor: Color(0xffFFF9E8),
//           backgroundColor: Colors.transparent,
//
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//       );
//     }
//
//     if (firstPage == null) {
//       return Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage("assets/images/main_bg.png")),
//         ),
//         child: const Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Center(
//             child: Text(
//               'حدث خطأ في تحميل السورة',
//             ),
//           ),
//         ),
//       );
//     }
//
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(image: AssetImage("assets/images/main_bg.png"))
//       ),
//       child: Scaffold(
//         // backgroundColor: const Color(0xffFFF9E8),
//         backgroundColor: Colors.transparent,
//
//
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           title: Text(currentSurahName,style: GoogleFonts.elMessiri(
//             fontSize: 28,
//             fontWeight: FontWeight(700)
//           ),),
//           centerTitle: true,
//
//         ),
//         body: SafeArea(
//
//           // top: false,
//           child: Directionality(
//             textDirection: TextDirection.rtl,
//
//             child: PageView.builder(
//               controller: pageController,
//
//               itemCount: 604,
//               onPageChanged: (index) async {
//                 final pageNumber = index + 1;
//
//                 final surahName = await getSurahNameForPage(
//                   pageNumber,
//                 );
//
//                 if (!mounted || surahName == null) {
//                   return;
//                 }
//
//                 if (surahName == currentSurahName) {
//                   return;
//                 }
//
//                 setState(() {
//                   currentSurahName = surahName;
//                 });
//               },
//
//               itemBuilder: (context, index) {
//
//                 final pageNumber = index + 1;
//
//                 return FutureBuilder(
//                   future: _loadPage(pageNumber),
//
//                   builder: (
//                       context,
//                       snapshot,
//                       ) {
//
//                     if (snapshot.connectionState ==
//                         ConnectionState.waiting) {
//
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//
//                     if (snapshot.hasError) {
//
//                       return Center(
//                         child: Text(
//                           'Error: ${snapshot.error}',
//                         ),
//                       );
//                     }
//
//                     final data = snapshot.data!;
//
//                     return Padding(
//                       padding: const EdgeInsetsGeometry.directional(top: 10,bottom: 10,end: 10,start: 10),
//                       child: Card(
//
//                         color: Colors.white.withValues(alpha: 0.7),
//                         elevation: 0,
//                         child: QuranPage(
//                           page: data.page,
//                           fontFamily: data.fontFamily,
//                           basmalaFontFamily: data.basmalaFontFamily,
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<_QuranPageData> _loadPage(
//       int pageNumber,
//       ) async {
//
//     final page = await QuranAssetService.loadPage(
//       pageNumber,
//     );
//
//     final fontFamily =
//     await QuranFontService.loadPageFont(
//       pageNumber,
//     );
//
//     final basmalaFontFamily =
//     await QuranFontService.loadBasmalaFont();
//
//     return _QuranPageData(
//       page: page,
//       fontFamily: fontFamily,
//       basmalaFontFamily: basmalaFontFamily,
//     );
//   }
// }
//
// class _QuranPageData {
//
//   final QuranPageModel page;
//
//   final String fontFamily;
//
//   final String basmalaFontFamily;
//
//   _QuranPageData({
//     required this.page,
//     required this.fontFamily,
//     required this.basmalaFontFamily,
//   });
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:islami_app/quran/modles/quran_page_model.dart';
import 'package:islami_app/quran/modles/sura_model.dart';
import 'package:islami_app/quran/services/quran_asset_service.dart';
import 'package:islami_app/quran/services/quran_font_service.dart';
import 'package:islami_app/quran/widgets/quran_page.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "QuranDetails";

  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  late SuraModel model;

  late PageController pageController;

  int? firstPage;

  late String currentSurahName = model.name;

  bool isLoading = true;

  bool _loadedArguments = false;

  // كاش للـ Future بتاع كل صفحة، عشان FutureBuilder ميعملش تحميل جديد
  // كل ما الـ widget يعمل rebuild
  final Map<int, Future<_QuranPageData>> _pageFutures = {};

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

  // بقت sync-ish: بتحمل بس الصفحة الحالية (لو مش متكاشة)، وبعدين
  // بتدور في الخريطة الجاهزة بدل ما تلف على كل صفحة قبلها
  Future<String?> getSurahNameForPage(int pageNumber) async {
    await QuranAssetService.loadPage(pageNumber);

    final map = QuranAssetService.surahFirstPageMap;

    int? bestSurah;
    int bestPage = -1;

    map.forEach((surahNumber, firstPage) {
      if (firstPage <= pageNumber && firstPage > bestPage) {
        bestPage = firstPage;
        bestSurah = surahNumber;
      }
    });

    if (bestSurah == null) return null;

    final index = bestSurah! - 1;

    if (index >= 0 && index < suraNames.length) {
      return suraNames[index];
    }

    return null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_loadedArguments) {
      return;
    }

    _loadedArguments = true;

    model = ModalRoute.of(context)!.settings.arguments as SuraModel;

    loadQuran();
  }

  Future<void> loadQuran() async {
    try {
      final surahNumber = model.index + 1;

      final page = await QuranAssetService.findSurahPage(surahNumber);

      if (!mounted) return;

      pageController = PageController(initialPage: page - 1);

      setState(() {
        firstPage = page;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Quran Error: $e');

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    if (!isLoading) {
      pageController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main_bg.png"),
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (firstPage == null) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main_bg.png"),
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(child: Text('حدث خطأ في تحميل السورة')),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/main_bg.png")),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            currentSurahName,
            style: GoogleFonts.elMessiri(
              fontSize: 28,
              fontWeight: FontWeight(700),
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: PageView.builder(
              controller: pageController,
              itemCount: 604,
              onPageChanged: (index) async {
                final pageNumber = index + 1;

                final surahName = await getSurahNameForPage(pageNumber);

                if (!mounted || surahName == null) {
                  return;
                }

                if (surahName == currentSurahName) {
                  return;
                }

                setState(() {
                  currentSurahName = surahName;
                });
              },
              itemBuilder: (context, index) {
                final pageNumber = index + 1;

                return FutureBuilder(
                  future: _loadPage(pageNumber), // بقت مكاشة
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    final data = snapshot.data!;

                    return Padding(
                      padding: const EdgeInsetsGeometry.directional(
                        top: 10,
                        bottom: 10,
                        end: 10,
                        start: 10,
                      ),
                      child: Card(
                        color: Colors.white.withValues(alpha: 0.7),
                        elevation: 0,
                        child: QuranPage(
                          page: data.page,
                          fontFamily: data.fontFamily,
                          basmalaFontFamily: data.basmalaFontFamily,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // بدل ما نعمل Future جديد كل build، نتأكد إننا بنرجع نفس الـ Future
  // لو الصفحة دي طُلبت قبل كده
  Future<_QuranPageData> _loadPage(int pageNumber) {
    return _pageFutures.putIfAbsent(
      pageNumber,
          () => _loadPageInternal(pageNumber),
    );
  }

  Future<_QuranPageData> _loadPageInternal(int pageNumber) async {
    final page = await QuranAssetService.loadPage(pageNumber);

    final fontFamily = await QuranFontService.loadPageFont(pageNumber);

    final basmalaFontFamily = await QuranFontService.loadBasmalaFont();

    return _QuranPageData(
      page: page,
      fontFamily: fontFamily,
      basmalaFontFamily: basmalaFontFamily,
    );
  }
}

class _QuranPageData {
  final QuranPageModel page;
  final String fontFamily;
  final String basmalaFontFamily;

  _QuranPageData({
    required this.page,
    required this.fontFamily,
    required this.basmalaFontFamily,
  });
}