class Repository {
  final String? name;
  final String? language;
  final String? description;
  final int? forksCount;

  Repository({this.name, this.language, this.description, this.forksCount});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'],
      language: json['language'],
      description: json['description'] ?? 'Sem descrição!',
      forksCount: json['forks_count']
    );
  }
}