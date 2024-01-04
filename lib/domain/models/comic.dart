// To parse this JSON data, do
//
//     final temperatures = temperaturesFromMap(jsonString);

import 'dart:convert';

Temperatures temperaturesFromMap(String str) =>
    Temperatures.fromMap(json.decode(str));

String temperaturesToMap(Temperatures data) => json.encode(data.toMap());

class Temperatures {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final Data? data;

  Temperatures({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory Temperatures.fromMap(Map<String, dynamic> json) => Temperatures(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data?.toMap(),
      };
}

class Data {
  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<Result>? results;

  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class Result {
  final int? id;
  final int? digitalId;
  final String? title;
  final int? issueNumber;
  final String? variantDescription;
  final String? description;
  final String? modified;
  final String? isbn;
  final String? upc;
  final String? diamondCode;
  final String? ean;
  final String? issn;
  final String? format;
  final int? pageCount;
  final List<TextObject>? textObjects;
  final String? resourceUri;
  final List<Url>? urls;
  final Series? series;
  final List<Series>? variants;
  final List<dynamic>? collections;
  final List<Series>? collectedIssues;
  final List<Date>? dates;
  final List<Price>? prices;
  final Thumbnail? thumbnail;
  final List<Thumbnail>? images;
  final Creators? creators;
  final Characters? characters;
  final Stories? stories;
  final Characters? events;

  Result({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: json["ean"],
        issn: json["issn"],
        format: json["format"],
        pageCount: json["pageCount"],
        textObjects: json["textObjects"] == null
            ? []
            : List<TextObject>.from(
                json["textObjects"]!.map((x) => TextObject.fromMap(x))),
        resourceUri: json["resourceURI"],
        urls: json["urls"] == null
            ? []
            : List<Url>.from(json["urls"]!.map((x) => Url.fromMap(x))),
        series: json["series"] == null ? null : Series.fromMap(json["series"]),
        variants: json["variants"] == null
            ? []
            : List<Series>.from(
                json["variants"]!.map((x) => Series.fromMap(x))),
        collections: json["collections"] == null
            ? []
            : List<dynamic>.from(json["collections"]!.map((x) => x)),
        collectedIssues: json["collectedIssues"] == null
            ? []
            : List<Series>.from(
                json["collectedIssues"]!.map((x) => Series.fromMap(x))),
        dates: json["dates"] == null
            ? []
            : List<Date>.from(json["dates"]!.map((x) => Date.fromMap(x))),
        prices: json["prices"] == null
            ? []
            : List<Price>.from(json["prices"]!.map((x) => Price.fromMap(x))),
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromMap(json["thumbnail"]),
        images: json["images"] == null
            ? []
            : List<Thumbnail>.from(
                json["images"]!.map((x) => Thumbnail.fromMap(x))),
        creators: json["creators"] == null
            ? null
            : Creators.fromMap(json["creators"]),
        characters: json["characters"] == null
            ? null
            : Characters.fromMap(json["characters"]),
        stories:
            json["stories"] == null ? null : Stories.fromMap(json["stories"]),
        events:
            json["events"] == null ? null : Characters.fromMap(json["events"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        "issueNumber": issueNumber,
        "variantDescription": variantDescription,
        "description": description,
        "modified": modified,
        "isbn": isbn,
        "upc": upc,
        "diamondCode": diamondCode,
        "ean": ean,
        "issn": issn,
        "format": format,
        "pageCount": pageCount,
        "textObjects": textObjects == null
            ? []
            : List<dynamic>.from(textObjects!.map((x) => x.toMap())),
        "resourceURI": resourceUri,
        "urls":
            urls == null ? [] : List<dynamic>.from(urls!.map((x) => x.toMap())),
        "series": series?.toMap(),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toMap())),
        "collections": collections == null
            ? []
            : List<dynamic>.from(collections!.map((x) => x)),
        "collectedIssues": collectedIssues == null
            ? []
            : List<dynamic>.from(collectedIssues!.map((x) => x.toMap())),
        "dates": dates == null
            ? []
            : List<dynamic>.from(dates!.map((x) => x.toMap())),
        "prices": prices == null
            ? []
            : List<dynamic>.from(prices!.map((x) => x.toMap())),
        "thumbnail": thumbnail?.toMap(),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toMap())),
        "creators": creators?.toMap(),
        "characters": characters?.toMap(),
        "stories": stories?.toMap(),
        "events": events?.toMap(),
      };
}

class Characters {
  final int? available;
  final String? collectionUri;
  final List<Series>? items;
  final int? returned;

  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Characters.fromMap(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<Series>.from(json["items"]!.map((x) => Series.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "returned": returned,
      };
}

class Series {
  final String? resourceUri;
  final String? name;

  Series({
    this.resourceUri,
    this.name,
  });

  factory Series.fromMap(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Creators {
  final int? available;
  final String? collectionUri;
  final List<CreatorsItem>? items;
  final int? returned;

  Creators({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Creators.fromMap(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<CreatorsItem>.from(
                json["items"]!.map((x) => CreatorsItem.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "returned": returned,
      };
}

class CreatorsItem {
  final String? resourceUri;
  final String? name;
  final String? role;

  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  factory CreatorsItem.fromMap(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
      };
}

class Date {
  final String? type;
  final String? date;

  Date({
    this.type,
    this.date,
  });

  factory Date.fromMap(Map<String, dynamic> json) => Date(
        type: json["type"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "date": date,
      };
}

class Thumbnail {
  final String? path;
  final String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "extension": extension,
      };
}

class Price {
  final String? type;
  final double? price;

  Price({
    this.type,
    this.price,
  });

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        type: json["type"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "price": price,
      };
}

class Stories {
  final int? available;
  final String? collectionUri;
  final List<StoriesItem>? items;
  final int? returned;

  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<StoriesItem>.from(
                json["items"]!.map((x) => StoriesItem.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "returned": returned,
      };
}

class StoriesItem {
  final String? resourceUri;
  final String? name;
  final String? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
      };
}

class TextObject {
  final String? type;
  final String? language;
  final String? text;

  TextObject({
    this.type,
    this.language,
    this.text,
  });

  factory TextObject.fromMap(Map<String, dynamic> json) => TextObject(
        type: json["type"],
        language: json["language"],
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "language": language,
        "text": text,
      };
}

class Url {
  final String? type;
  final String? url;

  Url({
    this.type,
    this.url,
  });

  factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "url": url,
      };
}
