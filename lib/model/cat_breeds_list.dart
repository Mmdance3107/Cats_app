import 'dart:convert';

List<CatBreed> catBreedFromJson(String str) =>
    List<CatBreed>.from(json.decode(str).map((x) => CatBreed.fromJson(x)));

class CatBreed {
  CatBreed({
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.wikipediaUrl,
    required this.image,
  });
  String name;
  String temperament;
  String origin;
  String description;
  String wikipediaUrl;
  String image;
  factory CatBreed.fromJson(Map<String?, dynamic> json) => CatBreed(
        name: json["name"],
        temperament: json["temperament"],
        origin: json["origin"],
        description: json["description"],
        wikipediaUrl: json["wikipedia_url"] ?? 'No wiki url',
        image: json["image"] == null || json["image"].isEmpty
            ? 'https://www.publicdomainpictures.net/pictures/280000/velka/question-mark-1544553868vD2.jpg'
            : json["image"]["url"],
      );
}
