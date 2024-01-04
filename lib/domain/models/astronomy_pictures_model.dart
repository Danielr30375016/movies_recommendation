import 'dart:convert';

List<AstronomyPicturesModel> AstronomyPicturesModelFromMap(String str) =>
    List<AstronomyPicturesModel>.from(
        json.decode(str).map((x) => AstronomyPicturesModel.fromMap(x)));

String AstronomyPicturesModelToMap(List<AstronomyPicturesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class AstronomyPicturesModel {
  final String? copyright;
  final DateTime? date;
  final String? explanation;
  final String? hdurl;
  final String? mediaType;
  final String? serviceVersion;
  final String? title;
  final String? url;

  AstronomyPicturesModel({
    this.copyright,
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  factory AstronomyPicturesModel.fromMap(Map<String, dynamic> json) =>
      AstronomyPicturesModel(
        copyright: json["copyright"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        explanation: json["explanation"],
        hdurl: json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "copyright": copyright,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "explanation": explanation,
        "hdurl": hdurl,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "url": url,
      };
}
