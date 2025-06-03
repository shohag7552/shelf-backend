// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'model.dart' as _i1;
import 'prisma.dart' as _i2;

class Post {
  const Post({
    this.id,
    this.title,
    this.content,
    this.published,
    this.authorId,
    this.createdAt,
    this.updatedAt,
    this.author,
  });

  factory Post.fromJson(Map json) => Post(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        published: json['published'],
        authorId: json['authorId'],
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
        author:
            json['author'] is Map ? _i1.User.fromJson(json['author']) : null,
      );

  final int? id;

  final String? title;

  final String? content;

  final bool? published;

  final int? authorId;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final _i1.User? author;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'authorId': authorId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'author': author?.toJson(),
      };
}

class User {
  const User({
    this.id,
    this.email,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.posts,
    this.$count,
  });

  factory User.fromJson(Map json) => User(
        id: json['id'],
        email: json['email'],
        name: json['name'],
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

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final Iterable<_i1.Post>? posts;

  final _i2.UserCountOutputType? $count;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'posts': posts?.map((e) => e.toJson()),
        '_count': $count?.toJson(),
      };
}
