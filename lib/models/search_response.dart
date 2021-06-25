// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
    SearchResponse({
        this.type,
        this.query,
        this.features,
        this.attribution,
    });

    String type;
    List<String> query;
    List<Feature> features;
    String attribution;

    factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        type: json["type"],
        query: List<String>.from(json["query"].map((x) => x)),
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
        attribution: json["attribution"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution,
    };
}

class Feature {
    Feature({
        this.id,
        this.type,
        this.placeType,
        this.relevance,
        this.properties,
        this.textEs,
        this.placeNameEs,
        this.text,
        this.placeName,
        this.center,
        this.geometry,
        this.context,
    });

    String id;
    String type;
    List<String> placeType;
    int relevance;
    Properties properties;
    String textEs;
    String placeNameEs;
    String text;
    String placeName;
    List<double> center;
    Geometry geometry;
    List<Context> context;

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        relevance: json["relevance"],
        properties: Properties.fromJson(json["properties"]),
        textEs: json["text_es"],
        placeNameEs: json["place_name_es"],
        text: json["text"],
        placeName: json["place_name"],
        center: List<double>.from(json["center"].map((x) => x.toDouble())),
        geometry: Geometry.fromJson(json["geometry"]),
        context: List<Context>.from(json["context"].map((x) => Context.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "relevance": relevance,
        "properties": properties.toJson(),
        "text_es": textEs,
        "place_name_es": placeNameEs,
        "text": text,
        "place_name": placeName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toJson(),
        "context": List<dynamic>.from(context.map((x) => x.toJson())),
    };
}

class Context {
    Context({
        this.id,
        this.wikidata,
        this.textEs,
        this.languageEs,
        this.text,
        this.language,
        this.shortCode,
    });

    Id id;
    Wikidata wikidata;
    Text2 textEs;
    Language languageEs;
    Text2 text;
    Language language;
    ShortCode shortCode;

    factory Context.fromJson(Map<String, dynamic> json) => Context(
        id: idValues.map[json["id"]],
        wikidata: wikidataValues.map[json["wikidata"]],
        textEs: textValues.map[json["text_es"]],
        languageEs: languageValues.map[json["language_es"]],
        text: textValues.map[json["text"]],
        language: languageValues.map[json["language"]],
        shortCode: json["short_code"] == null ? null : shortCodeValues.map[json["short_code"]],
    );

    Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "wikidata": wikidataValues.reverse[wikidata],
        "text_es": textValues.reverse[textEs],
        "language_es": languageValues.reverse[languageEs],
        "text": textValues.reverse[text],
        "language": languageValues.reverse[language],
        "short_code": shortCode == null ? null : shortCodeValues.reverse[shortCode],
    };
}

enum Id { PLACE_8868866485276670, REGION_14275868231278040, COUNTRY_9933875229773450 }

final idValues = EnumValues({
    "country.9933875229773450": Id.COUNTRY_9933875229773450,
    "place.8868866485276670": Id.PLACE_8868866485276670,
    "region.14275868231278040": Id.REGION_14275868231278040
});

enum Language { ES }

final languageValues = EnumValues({
    "es": Language.ES
});

enum ShortCode { MX_GUA, MX }

final shortCodeValues = EnumValues({
    "mx": ShortCode.MX,
    "MX-GUA": ShortCode.MX_GUA
});

enum Text2 { LEN, GUANAJUATO, MXICO }

final textValues = EnumValues({
    "Guanajuato": Text2.GUANAJUATO,
    "León": Text2.LEN,
    "México": Text2.MXICO
});

enum Wikidata { Q189128, Q46475, Q96 }

final wikidataValues = EnumValues({
    "Q189128": Wikidata.Q189128,
    "Q46475": Wikidata.Q46475,
    "Q96": Wikidata.Q96
});

class Geometry {
    Geometry({
        this.coordinates,
        this.type,
    });

    List<double> coordinates;
    String type;

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
    };
}

class Properties {
    Properties({
        this.foursquare,
        this.landmark,
        this.address,
        this.category,
    });

    String foursquare;
    bool landmark;
    String address;
    String category;

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        foursquare: json["foursquare"],
        landmark: json["landmark"],
        address: json["address"] == null ? null : json["address"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "foursquare": foursquare,
        "landmark": landmark,
        "address": address == null ? null : address,
        "category": category,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
