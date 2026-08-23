import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:islami_app/home/api_models/surah_details_model.dart';


class ApiManager {
  static const String baseUrl = 'https://api.alquran.cloud/v1';

  static Future<SurahDetailsModel> getSurah(int surahNumber) async {
    final url = Uri.parse(
      '$baseUrl/surah/$surahNumber/quran-uthmani',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return SurahDetailsModel.fromJson(data['data']);
    } else {
      throw Exception(
        'Failed to load Surah: ${response.statusCode}',
      );
    }
  }
}