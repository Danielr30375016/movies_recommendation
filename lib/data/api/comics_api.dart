import 'dart:convert' as convert;
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movies_recommendation/domain/models/comic.dart';

class ComicsApi {
  String apiUrl;
  String publicKeyMarvel;
  String privateKeyMarvel;
  int ts = 1;

  static const String allComics =
      "/v1/public/comics?ts=ts@@&apikey=apikey@@&hash=hash@@";

  ComicsApi({
    required this.apiUrl,
    required this.publicKeyMarvel,
    required this.privateKeyMarvel,
  });

  Future<Temperatures> getAllComicsApi() async {
    Temperatures comics = Temperatures();
    try {
      Uri uri = Uri.parse(apiUrl +
          allComics
              .replaceAll("ts@@", ts.toString())
              .replaceAll("apikey@@", publicKeyMarvel)
              .replaceAll("hash@@", generateMd5()));

      var request = http.Request('GET', uri);
      request.body = '''''';

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();
        comics = Temperatures.fromMap(json.decode(data));
      } else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return comics;
  }

  String generateMd5() {
    String newApiKey = "$ts$privateKeyMarvel$publicKeyMarvel";
    String result = md5.convert(convert.utf8.encode(newApiKey)).toString();
    return result;
  }
}
