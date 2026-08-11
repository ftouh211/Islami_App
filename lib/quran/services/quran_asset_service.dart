// import 'dart:convert';
//
// import 'package:flutter/services.dart';
// import 'package:islami_app/quran/modles/quran_page_model.dart';
//
//
// class QuranAssetService {
//   static Future<QuranPageModel> loadPage(int pageNumber) async {
//     final page = pageNumber.toString().padLeft(3, '0');
//
//     final jsonString = await rootBundle.loadString(
//       'assets/quran/pages/page-$page.json',
//     );
//
//     final jsonData = jsonDecode(jsonString);
//
//     return QuranPageModel.fromJson(jsonData);
//   }
// }

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islami_app/quran/modles/quran_page_model.dart';


class QuranAssetService {
  static Future<QuranPageModel> loadPage(int pageNumber) async {
    final page = pageNumber.toString().padLeft(3, '0');

    final jsonString = await rootBundle.loadString(
      'assets/quran/pages/page-$page.json',
    );

    final jsonData = jsonDecode(jsonString);

    return QuranPageModel.fromJson(jsonData);
  }

  static Future<int> findSurahPage(int surahNumber) async {
    final surah = surahNumber.toString().padLeft(3, '0');

    for (int pageNumber = 1; pageNumber <= 604; pageNumber++) {
      final page = await loadPage(pageNumber);

      final found = page.lines.any(
            (line) =>
        line.type == 'surah-header' &&
            line.surah == surah,
      );

      if (found) {
        return pageNumber;
      }
    }

    throw Exception(
      'Surah $surahNumber not found',
    );
  }
}