import 'dart:convert';

class Instruction {
  String imageUrl;
  String description;
  int durationInMinutes;
  Instruction({
    required this.imageUrl,
    required this.description,
    required this.durationInMinutes,
  });

  Instruction copyWith({
    String? imageUrl,
    String? description,
    int? durationInMinutes,
  }) {
    return Instruction(
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      durationInMinutes: durationInMinutes ?? this.durationInMinutes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'description': description,
      'durationInMinutes': durationInMinutes,
    };
  }

  factory Instruction.fromMap(Map<String, dynamic> map) {
    return Instruction(
      imageUrl: map['imageUrl'],
      description: map['description'],
      durationInMinutes: map['durationInMinutes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Instruction.fromJson(String source) =>
      Instruction.fromMap(json.decode(source));

  @override
  String toString() =>
      'Instruction(imageUrl: $imageUrl, description: $description, durationInMinutes: $durationInMinutes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Instruction &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.durationInMinutes == durationInMinutes;
  }

  @override
  int get hashCode =>
      imageUrl.hashCode ^ description.hashCode ^ durationInMinutes.hashCode;
}
