// import 'package:flutter/services.dart';
//
// class QuranFontService {
//   static final Set<int> _loadedPages = {};
//
//   static Future<String> loadPageFont(int pageNumber) async {
//     final page = pageNumber.toString().padLeft(3, '0');
//
//     final fontFamily = 'QCF2$page';
//
//     if (!_loadedPages.contains(pageNumber)) {
//       final fontLoader = FontLoader(fontFamily);
//
//       fontLoader.addFont(rootBundle.load('assets/quran/fonts/QCF2$page.ttf'));
//
//       await fontLoader.load();
//
//       _loadedPages.add(pageNumber);
//     }
//
//     return fontFamily;
//   }
//
//   static Future<String> loadBasmalaFont() async {
//     const fontFamily = 'QCF2BSML';
//
//     if (!_loadedPages.contains(0)) {
//       final fontLoader = FontLoader(fontFamily);
//
//       fontLoader.addFont(rootBundle.load('assets/quran/fonts/QCF2BSML.ttf'));
//
//       await fontLoader.load();
//
//       _loadedPages.add(0);
//     }
//
//     return fontFamily;
//   }
// }

import 'package:flutter/services.dart';

class QuranFontService {
  static final Set<int> _loadedPages = {};

  static Future<String> loadPageFont(int pageNumber) async {
    final page = pageNumber.toString().padLeft(3, '0');

    final fontFamily = 'QCF2$page';

    if (!_loadedPages.contains(pageNumber)) {
      final fontLoader = FontLoader(fontFamily);

      fontLoader.addFont(rootBundle.load('assets/quran/fonts/QCF2$page.ttf'));

      await fontLoader.load();

      _loadedPages.add(pageNumber);
    }

    return fontFamily;
  }

  static Future<String> loadBasmalaFont() async {
    const fontFamily = 'QCF2BSML';

    if (!_loadedPages.contains(0)) {
      final fontLoader = FontLoader(fontFamily);

      fontLoader.addFont(rootBundle.load('assets/quran/fonts/QCF2BSML.ttf'));

      await fontLoader.load();

      _loadedPages.add(0);
    }

    return fontFamily;
  }
}