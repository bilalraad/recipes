import 'dart:convert';

class Ingredient {
  String imageUrl;
  String title;
  String source;
  Ingredient({
    required this.imageUrl,
    required this.title,
    required this.source,
  });

  Ingredient copyWith({
    String? imageUrl,
    String? title,
    String? source,
  }) {
    return Ingredient(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'source': source,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      imageUrl: map['imageUrl'],
      title: map['title'],
      source: map['source'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source));

  @override
  String toString() =>
      'Ingredient(imageUrl: $imageUrl, title: $title, source: $source)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ingredient &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.source == source;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ title.hashCode ^ source.hashCode;
}
