// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Repo {
  int id;
  String name;
  bool private;
  // ignore: non_constant_identifier_names
  String html_url;
  String description;
  bool fork;

  Repo({
    required this.id,
    required this.name,
    required this.private,
    // ignore: non_constant_identifier_names
    required this.html_url,
    required this.description,
    required this.fork,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'private': private,
      'html_url': html_url,
      'description': description,
      'fork': fork,
    };
  }

  factory Repo.fromMap(Map<String, dynamic> map) {
    return Repo(
      id: map['id'] as int,
      name: map['name'] as String,
      private: map['private'] as bool,
      html_url: map['html_url'] as String,
      description: map['description'] ?? '',
      fork: map['fork'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Repo.fromJson(String source) =>
      Repo.fromMap(json.decode(source) as Map<String, dynamic>);
}
