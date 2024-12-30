class Musician {
  final int id;
  final String name;

  Musician({required this.id, required this.name});

  factory Musician.fromJson(Map<String, dynamic> json) {
    return Musician( // User -> Musician に修正
      id: json['id'],
      name: json['name'],
    );
  }
}