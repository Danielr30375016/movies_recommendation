import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movies_recommendation/domain/models/astronomy_pictures_model.dart';

class NasaApi {
  String apiNasa = dotenv.env['API_NASA'] ?? '';
  String apiKeyNasa = dotenv.env['API_KEY_NASA'] ?? '';

  static const String astronomyPictures =
      "/planetary/apod?api_key=DEMO_KEY&&start_date=2023-12-1&end_date=2023-12-12";

  Future<List<AstronomyPicturesModel>> getAstronomyPictures() async {
    List<AstronomyPicturesModel> astronomyImages = [];
    Uri url = Uri.parse(
        apiNasa + astronomyPictures.replaceAll("DEMO_KEY", apiKeyNasa));
    try {
      var request = http.Request('GET', url);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();
        try {
          astronomyImages = [AstronomyPicturesModel.fromMap(json.decode(data))];
        } catch (e) {
          json.decode(data).forEach(
              (e) => astronomyImages.add(AstronomyPicturesModel.fromMap(e)));
        }
      }
    } catch (e) {
      return [];
    }
    return astronomyImages;
  }
}
