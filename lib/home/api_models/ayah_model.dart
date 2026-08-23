class AyahModel {
  final int number;
  final int numberInSurah;
  final String text;

  AyahModel({
    required this.number,
    required this.numberInSurah,
    required this.text,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      number: json['number'],
      numberInSurah: json['numberInSurah'],
      text: json['text'],
    );
  }
}