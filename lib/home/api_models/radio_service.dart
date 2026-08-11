// lib/radio/services/radio_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:islami_app/home/api_models/radio_model.dart';

class RadioService {
  static const String _baseUrl = 'https://mp3quran.net/api/v3/radios?language=ar';

  // كاش بسيط عشان مش نطلب من النت كل مرة تفتح فيها التاب
  static List<RadioModel>? _cachedRadios;

  static Future<List<RadioModel>> getRadios() async {
    if (_cachedRadios != null) {
      return _cachedRadios!;
    }

    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode != 200) {
      throw Exception('فشل تحميل الإذاعات');
    }

    final data = jsonDecode(response.body);

    final radiosJson = data['radios'] as List<dynamic>;

    final radios = radiosJson
        .map((json) => RadioModel.fromJson(json as Map<String, dynamic>))
        .toList();

    _cachedRadios = radios;

    return radios;
  }
}