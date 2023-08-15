class User {
  final String? avatar;
  final String? username;
  final String? description;

  User({this.avatar, this.username, this.description});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      avatar: json['avatar_url'],
      username: json['name'],
      description: json['bio'] ?? 'Sem bio disponível',
    );
  }
}