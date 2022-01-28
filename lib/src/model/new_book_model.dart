// To parse this JSON data, do
//
//     final newBookModel = newBookModelFromJson(jsonString);

import 'dart:convert';

List<NewBookModel> newBookModelFromJson(String str) => List<NewBookModel>.from(
    json.decode(str).map((x) => NewBookModel.fromJson(x)));

class NewBookModel {
  NewBookModel({
    required this.id,
    required this.name,
    required this.image,
    required this.fullLength,
    required this.author,
  });

  int id;
  String name;
  Image image;
  FullLength fullLength;
  List<Author> author;

  factory NewBookModel.fromJson(Map<String, dynamic> json) => NewBookModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        image: Image.fromJson(json["image"]),
        fullLength: FullLength.fromJson(json["full_length"]),
        author:
            List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
      );
}

class Author {
  Author({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
      );


}

class FullLength {
  FullLength({
    required this.value,
    required this.formatted,
  });

  int value;
  String formatted;

  factory FullLength.fromJson(Map<String, dynamic> json) => FullLength(
        value: json["value"] ?? 0,
        formatted: json["formatted"] ?? "",
      );
}

class Image {
  Image({
    required this.thumbnail,
    required this.medium,
    required this.large,
    required this.full,
  });

  bool thumbnail;
  bool medium;
  bool large;
  bool full;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        thumbnail: json["thumbnail"] ?? false,
        medium: json["medium"] ?? false,
        large: json["large"] ?? false,
        full: json["full"] ?? false,
      );
}
