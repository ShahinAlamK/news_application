// To parse this JSON data, do
//
//     final sourceModel = sourceModelFromJson(jsonString);

import 'dart:convert';

SourceModel sourceModelFromJson(String str) => SourceModel.fromJson(json.decode(str));

String sourceModelToJson(SourceModel data) => json.encode(data.toJson());

class SourceModel {
    SourceModel({
        required this.id,
        required this.name,
        required this.description,
        required this.url,
        required this.category,
        required this.language,
        required this.country,
    });

    String id;
    String name;
    String description;
    String url;
    String category;
    String language;
    String country;

    factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
        "category": category,
        "language": language,
        "country": country,
    };
}
