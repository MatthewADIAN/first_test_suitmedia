class Album {
  final int id;
  final String name;
  final String birthdate;

  Album({
    required this.id,
    required this.name,
    required this.birthdate,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      name: json['name'],
      birthdate: json['birthdate'],
    );
  }
}