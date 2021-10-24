import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'post.dart';
import 'recipe.dart';

class ExploreData {
  List<Recipe> recipesData;
  List<Post> friendsFeed;
  ExploreData({
    required this.recipesData,
    required this.friendsFeed,
  });

  ExploreData copyWith({
    List<Recipe>? recipesData,
    List<Post>? friendsFeed,
  }) {
    return ExploreData(
      recipesData: recipesData ?? this.recipesData,
      friendsFeed: friendsFeed ?? this.friendsFeed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'recipesData': recipesData.map((x) => x.toMap()).toList(),
      'friendsFeed': friendsFeed.map((x) => x.toMap()).toList(),
    };
  }

  factory ExploreData.fromMap(Map<String, dynamic> map) {
    return ExploreData(
      recipesData:
          List<Recipe>.from(map['recipesData']?.map((x) => Recipe.fromMap(x))),
      friendsFeed:
          List<Post>.from(map['friendsFeed']?.map((x) => Post.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExploreData.fromJson(String source) =>
      ExploreData.fromMap(json.decode(source));

  @override
  String toString() =>
      'ExploreData(recipesData: $recipesData, friendsFeed: $friendsFeed)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExploreData &&
        listEquals(other.recipesData, recipesData) &&
        listEquals(other.friendsFeed, friendsFeed);
  }

  @override
  int get hashCode => recipesData.hashCode ^ friendsFeed.hashCode;
}
