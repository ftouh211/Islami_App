// class QuranWordModel {
//   final String location;
//   final String word;
//   final String qpcV2;
//   final String qpcV1;
//
//   QuranWordModel({
//     required this.location,
//     required this.word,
//     required this.qpcV2,
//     required this.qpcV1,
//   });
//
//   factory QuranWordModel.fromJson(Map<String, dynamic> json) {
//     return QuranWordModel(
//       location: json['location'] ?? '',
//       word: json['word'] ?? '',
//       qpcV2: json['qpcV2'] ?? '',
//       qpcV1: json['qpcV1'] ?? '',
//     );
//   }
// }
//
// class QuranLineModel {
//   final int line;
//   final String type;
//   final String text;
//   final String? surah;
//   final String? verseRange;
//   final List<QuranWordModel> words;
//
//   QuranLineModel({
//     required this.line,
//     required this.type,
//     required this.text,
//     this.surah,
//     this.verseRange,
//     required this.words,
//   });
//
//   factory QuranLineModel.fromJson(Map<String, dynamic> json) {
//     return QuranLineModel(
//       line: json['line'] ?? 0,
//       type: json['type'] ?? '',
//       text: json['text'] ?? '',
//       surah: json['surah'],
//       verseRange: json['verseRange'],
//       words: (json['words'] as List<dynamic>? ?? [])
//           .map(
//             (word) => QuranWordModel.fromJson(
//           word as Map<String, dynamic>,
//         ),
//       )
//           .toList(),
//     );
//   }
// }
//
// class QuranPageModel {
//   final int page;
//   final List<QuranLineModel> lines;
//
//   QuranPageModel({
//     required this.page,
//     required this.lines,
//   });
//
//   factory QuranPageModel.fromJson(Map<String, dynamic> json) {
//     return QuranPageModel(
//       page: json['page'] ?? 0,
//       lines: (json['lines'] as List<dynamic>? ?? [])
//           .map(
//             (line) => QuranLineModel.fromJson(
//           line as Map<String, dynamic>,
//         ),
//       )
//           .toList(),
//     );
//   }
// }

class QuranWordModel {
  final String location;
  final String word;
  final String qpcV2;
  final String qpcV1;

  QuranWordModel({
    required this.location,
    required this.word,
    required this.qpcV2,
    required this.qpcV1,
  });

  factory QuranWordModel.fromJson(Map<String, dynamic> json) {
    return QuranWordModel(
      location: json['location'] ?? '',
      word: json['word'] ?? '',
      qpcV2: json['qpcV2'] ?? '',
      qpcV1: json['qpcV1'] ?? '',
    );
  }
}

class QuranLineModel {
  final int line;
  final String type;
  final String text;
  final String? surah;
  final String? verseRange;
  final String? qpcV2;

  final List<QuranWordModel> words;

  QuranLineModel({
    required this.line,
    required this.type,
    required this.text,
    this.surah,
    this.verseRange,
    this.qpcV2,
    required this.words,
  });

  factory QuranLineModel.fromJson(Map<String, dynamic> json) {
    return QuranLineModel(
      line: json['line'] ?? 0,
      type: json['type'] ?? '',
      text: json['text'] ?? '',
      surah: json['surah'],
      verseRange: json['verseRange'],
      qpcV2: json['qpcV2'],

      words: (json['words'] as List<dynamic>? ?? [])
          .map(
            (word) => QuranWordModel.fromJson(
          word as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }
}

class QuranPageModel {
  final int page;
  final List<QuranLineModel> lines;

  QuranPageModel({
    required this.page,
    required this.lines,
  });

  factory QuranPageModel.fromJson(Map<String, dynamic> json) {
    return QuranPageModel(
      page: json['page'] ?? 0,

      lines: (json['lines'] as List<dynamic>? ?? [])
          .map(
            (line) => QuranLineModel.fromJson(
          line as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }
}