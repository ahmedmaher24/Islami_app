import 'dart:convert';

import 'package:islamic/core/models/radio_response_model.dart';
import 'package:http/http.dart' as http;

import '../core/models/reciters_response_model.dart';

class ApiManager {
  static Future<RadioResponseModel> getRadioData() async {
    try {
      Uri uri = Uri.parse("https://www.mp3quran.net/api/v3/radios?language=ar");
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RadioResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw e;
    }
  }

  static Future<RecitersResponseModel> getRecitersaData() async {
    try {
      Uri uri = Uri.parse(
        "https://www.mp3quran.net/api/v3/reciters?language=ar",
      );
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RecitersResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw e;
    }
  }
}
