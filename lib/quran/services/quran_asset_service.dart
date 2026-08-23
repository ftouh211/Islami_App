// import 'dart:convert';
//
// import 'package:flutter/services.dart';
// import 'package:islami_app/quran/modles/quran_page_model.dart';
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
//
//   static Future<int> findSurahPage(int surahNumber) async {
//     final surah = surahNumber.toString().padLeft(3, '0');
//
//     for (int pageNumber = 1; pageNumber <= 604; pageNumber++) {
//       final page = await loadPage(pageNumber);
//
//       final found = page.lines.any(
//         (line) => line.type == 'surah-header' && line.surah == surah,
//       );
//
//       if (found) {
//         return pageNumber;
//       }
//     }
//
//     throw Exception('Surah $surahNumber not found');
//   }
// }


import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islami_app/quran/modles/quran_page_model.dart';

class QuranAssetService {
  // كاش الصفحات: لو الصفحة اتحملت قبل كده، ترجع من الميموري على طول
  static final Map<int, QuranPageModel> _pageCache = {};

  // خريطة: رقم السورة -> أول صفحة بتبدأ فيها
  // بتتبني تلقائيًا كل ما صفحة جديدة تتحمل وتحتوي على surah-header
  static final Map<int, int> _surahFirstPageCache = {};

  // آخر صفحة اتعمل لها scan فيها بحثًا عن سور جديدة (عشان findSurahPage
  // ميعيدش يمسح من الأول كل مرة)
  static int _lastScannedPage = 0;

  static Future<QuranPageModel> loadPage(int pageNumber) async {
    if (_pageCache.containsKey(pageNumber)) {
      return _pageCache[pageNumber]!;
    }

    final page = pageNumber.toString().padLeft(3, '0');

    final jsonString = await rootBundle.loadString(
      'assets/quran/pages/page-$page.json',
    );

    final jsonData = jsonDecode(jsonString);

    final model = QuranPageModel.fromJson(jsonData);

    _pageCache[pageNumber] = model;

    _indexPage(pageNumber, model);

    return model;
  }

  // بتسجل في الخريطة أي surah-header موجود في الصفحة دي
  static void _indexPage(int pageNumber, QuranPageModel model) {
    for (final line in model.lines) {
      if (line.type == 'surah-header' && line.surah != null) {
        final surahNumber = int.tryParse(line.surah!);

        if (surahNumber != null &&
            !_surahFirstPageCache.containsKey(surahNumber)) {
          _surahFirstPageCache[surahNumber] = pageNumber;
        }
      }
    }
  }

  static Future<int> findSurahPage(int surahNumber) async {
    // لو السورة دي معروفة بالفعل من قبل، رجعها فورًا من غير أي تحميل
    if (_surahFirstPageCache.containsKey(surahNumber)) {
      return _surahFirstPageCache[surahNumber]!;
    }

    // كمّل السكان من حيث ما وقفنا، مش من صفحة 1 كل مرة
    for (
    int pageNumber = _lastScannedPage + 1;
    pageNumber <= 604;
    pageNumber++
    ) {
      await loadPage(pageNumber); // بيكاش الصفحة ويبني الـ index تلقائي
      _lastScannedPage = pageNumber;

      if (_surahFirstPageCache.containsKey(surahNumber)) {
        return _surahFirstPageCache[surahNumber]!;
      }
    }

    throw Exception('Surah $surahNumber not found');
  }

  // عشان نستخدمها في getSurahNameForPage من غير ما نلف على أي حاجة
  static Map<int, int> get surahFirstPageMap => _surahFirstPageCache;
}