class Fakultet {
  int id;
  String title;

  Fakultet({required this.id, required this.title});

  factory Fakultet.fromJson(Map<String, dynamic> json) {
    return Fakultet(
      id: json['id'],
      title: json['title'],
    );
  }
}