class Teacher {
  int id;

  String name;

  Teacher({required this.id, required this.name});

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
    );
  }
}