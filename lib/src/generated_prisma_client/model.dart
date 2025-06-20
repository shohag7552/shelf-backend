// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'model.dart' as _i1;
import 'prisma.dart' as _i2;

class Post {
  const Post({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
    this.author,
  });

  factory Post.fromJson(Map json) => Post(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        published: json['published'],
        imageUrl: json['imageUrl'],
        createdAt: switch (json['createdAt']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['createdAt']
        },
        updatedAt: switch (json['updatedAt']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['updatedAt']
        },
        authorId: json['authorId'],
        author:
            json['author'] is Map ? _i1.User.fromJson(json['author']) : null,
      );

  final int? id;

  final String? title;

  final String? content;

  final bool? published;

  final String? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final int? authorId;

  final _i1.User? author;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'authorId': authorId,
        'author': author?.toJson(),
      };
}

class User {
  const User({
    this.id,
    this.email,
    this.name,
    this.imageUrl,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.posts,
    this.$count,
  });

  factory User.fromJson(Map json) => User(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        password: json['password'],
        role: json['role'],
        createdAt: switch (json['createdAt']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['createdAt']
        },
        updatedAt: switch (json['updatedAt']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['updatedAt']
        },
        posts: (json['posts'] as Iterable?)
            ?.map((json) => _i1.Post.fromJson(json)),
        $count: json['_count'] is Map
            ? _i2.UserCountOutputType.fromJson(json['_count'])
            : null,
      );

  final int? id;

  final String? email;

  final String? name;

  final String? imageUrl;

  final String? password;

  final String? role;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final Iterable<_i1.Post>? posts;

  final _i2.UserCountOutputType? $count;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'imageUrl': imageUrl,
        'password': password,
        'role': role,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'posts': posts?.map((e) => e.toJson()),
        '_count': $count?.toJson(),
      };
}
