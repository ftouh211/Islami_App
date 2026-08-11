import 'ayah_model.dart';

class SurahDetailsModel {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;
  final List<AyahModel> ayahs;

  SurahDetailsModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
    required this.ayahs,
  });

  factory SurahDetailsModel.fromJson(Map<String, dynamic> json) {
    return SurahDetailsModel(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      numberOfAyahs: json['numberOfAyahs'],
      revelationType: json['revelationType'],
      ayahs: (json['ayahs'] as List)
          .map((ayah) => AyahModel.fromJson(ayah))
          .toList(),
    );
  }
}