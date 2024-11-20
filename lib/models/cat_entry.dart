// To parse this JSON data, do
//
//     final catEntry = catEntryFromJson(jsonString);

import 'dart:convert';

List<CatEntry> catEntryFromJson(String str) => List<CatEntry>.from(json.decode(str).map((x) => CatEntry.fromJson(x)));

String catEntryToJson(List<CatEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatEntry {
    String model;
    String pk;
    Fields fields;

    CatEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory CatEntry.fromJson(Map<String, dynamic> json) => CatEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    String link;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.link,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "link": link,
    };
}
