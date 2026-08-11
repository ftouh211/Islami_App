// // import 'package:flutter/material.dart';
// // import 'package:islami_app/quran/modles/quran_page_model.dart';
// //
// //
// // class QuranPage extends StatelessWidget {
// //   final QuranPageModel page;
// //   final String fontFamily;
// //
// //   const QuranPage({
// //     super.key,
// //     required this.page,
// //     required this.fontFamily,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: const Color(0xffFFF9E8),
// //
// //       padding: const EdgeInsets.symmetric(
// //         horizontal: 20,
// //         vertical: 20,
// //       ),
// //
// //       child: Column(
// //         children: page.lines.map((line) {
// //           return _buildLine(line);
// //         }).toList(),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildLine(QuranLineModel line) {
// //     // اسم السورة
// //     if (line.type == 'surah-header') {
// //       return Padding(
// //         padding: const EdgeInsets.only(
// //           bottom: 20,
// //         ),
// //         child: Text(
// //           line.text,
// //           textDirection: TextDirection.rtl,
// //           textAlign: TextAlign.center,
// //           style: const TextStyle(
// //             fontFamily: 'QCF2BSML',
// //             fontSize: 25,
// //           ),
// //         ),
// //       );
// //     }
// //
// //     // آيات القرآن
// //     return Padding(
// //       padding: const EdgeInsets.only(
// //         bottom: 8,
// //       ),
// //       child: Text(
// //         line.words
// //             .map((word) => word.qpcV2)
// //             .join(' '),
// //
// //         textDirection: TextDirection.rtl,
// //
// //         textAlign: TextAlign.center,
// //
// //         style: TextStyle(
// //           fontFamily: fontFamily,
// //           fontSize: 25,
// //           height: 1.8,
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:islami_app/quran/modles/quran_page_model.dart';
//
//
// class QuranPage extends StatelessWidget {
//   final QuranPageModel page;
//   final String fontFamily;
//   final String basmalaFontFamily;
//
//   const QuranPage({
//     super.key,
//     required this.page,
//     required this.fontFamily,
//     required this.basmalaFontFamily,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffFFF9E8),
//
//       padding: const EdgeInsets.symmetric(
//         horizontal: 18,
//         vertical: 15,
//       ),
//
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//         children: page.lines.map(
//               (line) {
//             return _buildLine(line);
//           },
//         ).toList(),
//       ),
//     );
//   }
//
//   Widget _buildLine(QuranLineModel line) {
//
//     // =========================
//     // Surah Header
//     // =========================
//
//     if (line.type == 'surah-header') {
//       return SizedBox(
//         width: double.infinity,
//         child: FittedBox(
//           fit: BoxFit.scaleDown,
//           child: Text(
//             line.text,
//
//             textDirection: TextDirection.rtl,
//
//             textAlign: TextAlign.center,
//
//             style: const TextStyle(
//               fontSize: 26,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       );
//     }
//
//     // =========================
//     // Basmala
//     // =========================
//
//     if (line.type == 'basmala') {
//       return SizedBox(
//         width: double.infinity,
//         child: FittedBox(
//           fit: BoxFit.scaleDown,
//           child: Text(
//             line.qpcV2 ?? '',
//
//             textDirection: TextDirection.rtl,
//
//             textAlign: TextAlign.center,
//
//             style: TextStyle(
//               fontFamily: basmalaFontFamily,
//               fontSize: 28,
//             ),
//           ),
//         ),
//       );
//     }
//
//     // =========================
//     // Quran Text
//     // =========================
//
//     final qpcText = line.words
//         .map(
//           (word) => word.qpcV2,
//     )
//         .join(' ');
//
//     return SizedBox(
//       width: double.infinity,
//       child: FittedBox(
//         fit: BoxFit.scaleDown,
//
//         child: Text(
//           qpcText,
//
//           maxLines: 1,
//
//           softWrap: false,
//
//           textDirection: TextDirection.rtl,
//
//           textAlign: TextAlign.center,
//
//           style: TextStyle(
//             fontFamily: fontFamily,
//             fontSize: 26,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/quran/modles/quran_page_model.dart';


class QuranPage extends StatelessWidget {
  final QuranPageModel page;
  final String fontFamily;
  final String basmalaFontFamily;

  const QuranPage({
    super.key,
    required this.page,
    required this.fontFamily,
    required this.basmalaFontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color(0xffFFF9E8),
      color: Colors.transparent,

      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: FittedBox(
              fit: BoxFit.contain,

              child: SizedBox(
                width: 390,
                height: 760,

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: page.lines.map((line) {
                      return _buildLine(line);
                    }).toList(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLine(QuranLineModel line) {
    // ==========================================
    // Surah Header
    // ==========================================

    if (line.type == 'surah-header') {
      return SizedBox(
        width: double.infinity,

        child: FittedBox(
          fit: BoxFit.scaleDown,

          child: Text(
            line.text,

            maxLines: 1,
            softWrap: false,

            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              // color: Colors.blueAccent
              color: Color(0xFF0D47A1)
            ),
          ),
        ),
      );
    }

    // ==========================================
    // Basmala
    // ==========================================

    if (line.type == 'basmala') {
      return SizedBox(
        width: double.infinity,

        child: FittedBox(
          fit: BoxFit.scaleDown,

          child: Text(
            line.qpcV2 ?? '',

            maxLines: 1,
            softWrap: false,

            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,

            style: TextStyle(
              fontFamily: basmalaFontFamily,
              fontSize: 28,
              color: Colors.red
            ),
          ),
        ),
      );
    }

    // ==========================================
    // Quran Text
    // ==========================================

    final qpcText = line.words
        .map(
          (word) => word.qpcV2,
    )
        .join(' ');

    // return SizedBox(
    //   width: double.infinity,
    //
    //   child: FittedBox(
    //     fit: BoxFit.scaleDown,
    //
    //     child: Text(
    //       qpcText,
    //
    //       maxLines: 1,
    //       softWrap: false,
    //
    //       textDirection: TextDirection.rtl,
    //       textAlign: TextAlign.center,
    //
    //       style: TextStyle(
    //         fontFamily: fontFamily,
    //         fontSize: 26,
    //         // color: Colors.blueAccent
    //       ),
    //     ),
    //
    //
    //   ),
    // );

    return SizedBox(
      width: double.infinity,

      child: FittedBox(
        fit: BoxFit.scaleDown,

        child: Text.rich(
          TextSpan(
            children: line.words.map((word) {
              return TextSpan(
                text: '${word.qpcV2} ',

                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 26,
                ),

                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    debugPrint('Word: ${word.word}');
                    debugPrint('Location: ${word.location}');
                  },
              );
            }).toList(),
          ),

          maxLines: 1,
          softWrap: false,

          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}