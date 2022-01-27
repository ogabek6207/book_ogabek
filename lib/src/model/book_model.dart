// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

List<BookModel> bookModelFromJson(String str) =>
    List<BookModel>.from(json.decode(str).map((x) => BookModel.fromJson(x)));

class BookModel {
  BookModel({
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

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
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
        value: json["value"],
        formatted: json["formatted"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "formatted": formatted,
      };
}

class Image {
  Image({
    required this.thumbnail,
    required this.medium,
    required this.large,
    required this.full,
  });

  String thumbnail;
  String medium;
  String large;
  String full;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        thumbnail: json["thumbnail"],
        medium: json["medium"],
        large: json["large"],
        full: json["full"],
      );
}
