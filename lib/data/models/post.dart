import 'dart:convert';

class Post {
  final String id;
  final String profileImageUrl;
  final String comment;
  final String foodPictureUrl;
  final String timestamp;
  Post({
    required this.id,
    required this.profileImageUrl,
    required this.comment,
    required this.foodPictureUrl,
    required this.timestamp,
  });

  Post copyWith({
    String? id,
    String? profileImageUrl,
    String? comment,
    String? foodPictureUrl,
    String? timestamp,
  }) {
    return Post(
      id: id ?? this.id,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      comment: comment ?? this.comment,
      foodPictureUrl: foodPictureUrl ?? this.foodPictureUrl,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profileImageUrl': profileImageUrl,
      'comment': comment,
      'foodPictureUrl': foodPictureUrl,
      'timestamp': timestamp,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      profileImageUrl: map['profileImageUrl'],
      comment: map['comment'],
      foodPictureUrl: map['foodPictureUrl'],
      timestamp: map['timestamp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, profileImageUrl: $profileImageUrl, comment: $comment, foodPictureUrl: $foodPictureUrl, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.id == id &&
        other.profileImageUrl == profileImageUrl &&
        other.comment == comment &&
        other.foodPictureUrl == foodPictureUrl &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        profileImageUrl.hashCode ^
        comment.hashCode ^
        foodPictureUrl.hashCode ^
        timestamp.hashCode;
  }
}
