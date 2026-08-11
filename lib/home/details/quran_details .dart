// // import 'package:flutter/material.dart';
// // import 'package:islami_app/home/api_models/api_manager.dart';
// // import 'package:islami_app/home/api_models/surah_details_model.dart';
// //
// //
// // class QuranDetails extends StatefulWidget {
// //   final int surahNumber;
// //
// //   const QuranDetails({
// //     super.key,
// //     required this.surahNumber,
// //   });
// //
// //   @override
// //   State<QuranDetails> createState() => _QuranDetailsState();
// // }
// //
// // class _QuranDetailsState extends State<QuranDetails> {
// //   late Future<SurahDetailsModel> surahFuture;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     surahFuture = ApiManager.getSurah(widget.surahNumber);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // appBar: AppBar(
// //       //   title: const Text('القرآن الكريم'),
// //       //   centerTitle: true,
// //       // ),
// //
// //       body: FutureBuilder<SurahDetailsModel>(
// //         future: surahFuture,
// //
// //         builder: (context, snapshot) {
// //
// //           // Loading
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           }
// //
// //           // Error
// //           if (snapshot.hasError) {
// //             return Center(
// //               child: Text(
// //                 'حدث خطأ أثناء تحميل السورة\n${snapshot.error}',
// //                 textAlign: TextAlign.center,
// //               ),
// //             );
// //           }
// //
// //           // No data
// //           if (!snapshot.hasData) {
// //             return const Center(
// //               child: Text('لا توجد بيانات'),
// //             );
// //           }
// //
// //           final surah = snapshot.data!;
// //
// //           return Column(
// //             children: [
// //
// //               // اسم السورة
// //               Padding(
// //                 padding: const EdgeInsets.all(16),
// //                 child: Text(
// //                   surah.name,
// //                   textDirection: TextDirection.rtl,
// //                   style: const TextStyle(
// //                     fontSize: 25,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //
// //               // الآيات
// //               // Expanded(
// //               //   child: ListView.builder(
// //               //     padding: const EdgeInsets.symmetric(
// //               //       horizontal: 20,
// //               //       vertical: 10,
// //               //     ),
// //               //     itemCount: surah.ayahs.length,
// //               //     itemBuilder: (context, index) {
// //               //
// //               //       final ayah = surah.ayahs[index];
// //               //
// //               //       return Padding(
// //               //         padding: const EdgeInsets.only(
// //               //           bottom: 18,
// //               //         ),
// //               //
// //               //         child: Text(
// //               //           '${ayah.text} ﴿${ayah.numberInSurah}﴾',
// //               //
// //               //           textDirection: TextDirection.rtl,
// //               //
// //               //           textAlign: TextAlign.center,
// //               //
// //               //           style: const TextStyle(
// //               //             fontSize: 25,
// //               //             height: 2,
// //               //           ),
// //               //         ),
// //               //       );
// //               //     },
// //               //   ),
// //               // ),
// //
// //               Expanded(
// //                 child: Container(
// //                   width: double.infinity,
// //                   color: const Color(0xffFFF9E8),
// //                   child: SingleChildScrollView(
// //                     padding: const EdgeInsets.symmetric(
// //                       horizontal: 3,
// //                       vertical: 0,
// //                     ),
// //                     child: RichText(
// //                       textDirection: TextDirection.rtl,
// //                       textAlign: TextAlign.center,
// //                       text: TextSpan(
// //                         children: surah.ayahs.map((ayah) {
// //                           return TextSpan(
// //                             text: '${ayah.text} ',
// //                             style: const TextStyle(
// //                               fontFamily: 'Quran',
// //                               fontSize: 27,
// //                               height: 2.2,
// //                               color: Color(0xff1E1E1E),
// //                             ),
// //                           );
// //                         }).toList(),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// // //
//
// import 'package:flutter/material.dart';
// import 'package:islami_app/home/sura_model.dart';
// import 'package:islami_app/quran/modles/quran_page_model.dart';
// import 'package:islami_app/quran/services/quran_asset_service.dart';
// import 'package:islami_app/quran/services/quran_font_service.dart';
// import 'package:islami_app/quran/widgets/quran_page.dart';
//
// class QuranDetails extends StatefulWidget {
//   static const String routeName = "QuranDetails";
//
//   const QuranDetails({super.key});
//
//   @override
//   State<QuranDetails> createState() => _QuranDetailsState();
// }
//
// class _QuranDetailsState extends State<QuranDetails> {
//   late SuraModel model;
//
//   QuranPageModel? page;
//   String? fontFamily;
//
//   bool isLoading = true;
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//
//     model = ModalRoute.of(context)!.settings.arguments as SuraModel;
//
//     loadQuranPage();
//   }
//
//   Future<void> loadQuranPage() async {
//     try {
//       // مؤقتًا هنختبر الصفحة الأولى
//       final loadedPage = await QuranAssetService.loadPage(5);
//
//       final loadedFont = await QuranFontService.loadPageFont(5);
//
//       if (!mounted) return;
//
//       setState(() {
//         page = loadedPage;
//         fontFamily = loadedFont;
//         isLoading = false;
//       });
//     } catch (e) {
//       debugPrint('Quran Error: $e');
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
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }
//
//     if (page == null || fontFamily == null) {
//       return const Scaffold(
//         body: Center(child: Text('حدث خطأ في تحميل القرآن')),
//       );
//     }
//
//     return Scaffold(
//       backgroundColor: const Color(0xffFFF9E8),
//
//       body: SafeArea(
//         child: Center(child: QuranPage(page: page!, fontFamily: fontFamily!)),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:islami_app/home/sura_model.dart';
import 'package:islami_app/quran/modles/quran_page_model.dart';
import 'package:islami_app/quran/services/quran_asset_service.dart';
import 'package:islami_app/quran/services/quran_font_service.dart';
import 'package:islami_app/quran/widgets/quran_page.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "QuranDetails";

  const QuranDetails({
    super.key,
  });

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {

  late SuraModel model;

  late PageController pageController;

  int? firstPage;

  bool isLoading = true;

  bool _loadedArguments = false;

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

      // index عندك يبدأ من 0
      // القرآن يبدأ من 1
      final surahNumber = model.index + 1;

      final page = await QuranAssetService.findSurahPage(
        surahNumber,
      );

      if (!mounted) return;

      pageController = PageController(
        initialPage: page - 1,
      );

      setState(() {
        firstPage = page;
        isLoading = false;
      });

    } catch (e) {

      debugPrint(
        'Quran Error: $e',
      );

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
      return const Scaffold(
        backgroundColor: Color(0xffFFF9E8),

        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (firstPage == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            'حدث خطأ في تحميل السورة',
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffFFF9E8),

      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,

          child: PageView.builder(
            controller: pageController,

            itemCount: 604,

            itemBuilder: (context, index) {

              final pageNumber = index + 1;

              return FutureBuilder(
                future: _loadPage(pageNumber),

                builder: (
                    context,
                    snapshot,
                    ) {

                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {

                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                      ),
                    );
                  }

                  final data = snapshot.data!;

                  return QuranPage(
                    page: data.page,
                    fontFamily: data.fontFamily,
                    basmalaFontFamily: data.basmalaFontFamily,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<_QuranPageData> _loadPage(
      int pageNumber,
      ) async {

    final page = await QuranAssetService.loadPage(
      pageNumber,
    );

    final fontFamily =
    await QuranFontService.loadPageFont(
      pageNumber,
    );

    final basmalaFontFamily =
    await QuranFontService.loadBasmalaFont();

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