class Kafedra {
  int id;
  int fakultet_id;
  String title;

  Kafedra({required this.id, required this.title, required this.fakultet_id});

  factory Kafedra.fromJson(Map<String, dynamic> json) {
    return Kafedra(
      id: json['id'],
      fakultet_id: json['fakultet_id'],
      title: json['title'],
    );
  }
}