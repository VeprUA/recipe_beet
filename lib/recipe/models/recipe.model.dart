class Recipe {
  static const String tableName = 'recipes';
  final String id;
  final String title;

  const Recipe({required this.id, required this.title});

  factory Recipe.fromMap(Map<String, dynamic> json) =>
      Recipe(id: json['id'], title: json['title']);

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title};
  }

  @override
  String toString() {
    return 'Recipe{id: $id, title: $title}';
  }
}
