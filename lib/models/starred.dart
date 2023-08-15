class Starred {
  final String? name;
  final int? starCount;
  final String? description;
  final int? forksCount;

  Starred({this.name, this.starCount, this.description, this.forksCount});

  factory Starred.fromJson(Map<String, dynamic> json) {
    return Starred(
      name: json['name'],
      starCount: json['stargazers_count'],
      description: json['description'] ?? 'Sem descrição!',
      forksCount: json['forks_count']
    );
  }
}