// ignore_for_file: non_constant_identifier_names

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:orm/orm.dart' as _i1;

import 'prisma.dart' as _i2;

class UserCountOutputType {
  const UserCountOutputType({this.posts});

  factory UserCountOutputType.fromJson(Map json) =>
      UserCountOutputType(posts: json['posts']);

  final int? posts;

  Map<String, dynamic> toJson() => {'posts': posts};
}

class NestedIntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class IntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class NestedStringFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.search,
    this.not,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final String? search;

  final _i1.PrismaUnion<String, _i2.NestedStringFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'search': search,
        'not': not,
      };
}

class StringFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.search,
    this.not,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final String? search;

  final _i1.PrismaUnion<String, _i2.NestedStringFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'search': search,
        'not': not,
      };
}

class NestedStringNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.search,
    this.not,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final String? search;

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i2.NestedStringNullableFilter, _i1.PrismaNull>>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'search': search,
        'not': not,
      };
}

class StringNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.search,
    this.not,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final String? search;

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i2.NestedStringNullableFilter, _i1.PrismaNull>>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'search': search,
        'not': not,
      };
}

class NestedDateTimeFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedDateTimeFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class DateTimeFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class NestedBoolFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedBoolFilter({
    this.equals,
    this.not,
  });

  final _i1.PrismaUnion<bool, _i1.Reference<bool>>? equals;

  final _i1.PrismaUnion<bool, _i2.NestedBoolFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'not': not,
      };
}

class BoolFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const BoolFilter({
    this.equals,
    this.not,
  });

  final _i1.PrismaUnion<bool, _i1.Reference<bool>>? equals;

  final _i1.PrismaUnion<bool, _i2.NestedBoolFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'not': not,
      };
}

class UserScalarRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserScalarRelationFilter({
    this.$is,
    this.isNot,
  });

  final _i2.UserWhereInput? $is;

  final _i2.UserWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => {
        'is': $is,
        'isNot': isNot,
      };
}

class PostWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostWhereInput({
    this.AND,
    this.OR,
    this.NOT,
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

  final _i1.PrismaUnion<_i2.PostWhereInput, Iterable<_i2.PostWhereInput>>? AND;

  final Iterable<_i2.PostWhereInput>? OR;

  final _i1.PrismaUnion<_i2.PostWhereInput, Iterable<_i2.PostWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? title;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<_i2.BoolFilter, bool>? published;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? createdAt;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? updatedAt;

  final _i1.PrismaUnion<_i2.IntFilter, int>? authorId;

  final _i1.PrismaUnion<_i2.UserScalarRelationFilter, _i2.UserWhereInput>?
      author;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
        'author': author,
      };
}

class PostListRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostListRelationFilter({
    this.every,
    this.some,
    this.none,
  });

  final _i2.PostWhereInput? every;

  final _i2.PostWhereInput? some;

  final _i2.PostWhereInput? none;

  @override
  Map<String, dynamic> toJson() => {
        'every': every,
        'some': some,
        'none': none,
      };
}

class UserWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.posts,
  });

  final _i1.PrismaUnion<_i2.UserWhereInput, Iterable<_i2.UserWhereInput>>? AND;

  final Iterable<_i2.UserWhereInput>? OR;

  final _i1.PrismaUnion<_i2.UserWhereInput, Iterable<_i2.UserWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? email;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? name;

  final _i1.PrismaUnion<_i2.StringFilter, String>? password;

  final _i1.PrismaUnion<_i2.StringFilter, String>? role;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? createdAt;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? updatedAt;

  final _i2.PostListRelationFilter? posts;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'posts': posts,
      };
}

class UserWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserWhereUniqueInput({
    this.id,
    this.email,
    this.AND,
    this.OR,
    this.NOT,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.posts,
  });

  final int? id;

  final String? email;

  final _i1.PrismaUnion<_i2.UserWhereInput, Iterable<_i2.UserWhereInput>>? AND;

  final Iterable<_i2.UserWhereInput>? OR;

  final _i1.PrismaUnion<_i2.UserWhereInput, Iterable<_i2.UserWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? name;

  final _i1.PrismaUnion<_i2.StringFilter, String>? password;

  final _i1.PrismaUnion<_i2.StringFilter, String>? role;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? createdAt;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? updatedAt;

  final _i2.PostListRelationFilter? posts;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'posts': posts,
      };
}

class PostAuthorArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostAuthorArgs({
    this.select,
    this.include,
  });

  final _i2.UserSelect? select;

  final _i2.UserInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'select': select,
        'include': include,
      };
}

class PostInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostInclude({this.author});

  final _i1.PrismaUnion<bool, _i2.PostAuthorArgs>? author;

  @override
  Map<String, dynamic> toJson() => {'author': author};
}

enum SortOrder implements _i1.PrismaEnum {
  asc._('asc'),
  desc._('desc');

  const SortOrder._(this.name);

  @override
  final String name;
}

enum NullsOrder implements _i1.PrismaEnum {
  first._('first'),
  last._('last');

  const NullsOrder._(this.name);

  @override
  final String name;
}

class SortOrderInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SortOrderInput({
    required this.sort,
    this.nulls,
  });

  final _i2.SortOrder sort;

  final _i2.NullsOrder? nulls;

  @override
  Map<String, dynamic> toJson() => {
        'sort': sort,
        'nulls': nulls,
      };
}

class PostOrderByRelationAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostOrderByRelationAggregateInput({this.$count});

  final _i2.SortOrder? $count;

  @override
  Map<String, dynamic> toJson() => {'_count': $count};
}

enum UserOrderByRelevanceFieldEnum implements _i1.PrismaEnum {
  email._('email'),
  name$._('name'),
  password._('password'),
  role._('role');

  const UserOrderByRelevanceFieldEnum._(this.name);

  @override
  final String name;
}

class UserOrderByRelevanceInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserOrderByRelevanceInput({
    required this.fields,
    required this.sort,
    required this.search,
  });

  final _i1.PrismaUnion<_i2.UserOrderByRelevanceFieldEnum,
      Iterable<_i2.UserOrderByRelevanceFieldEnum>> fields;

  final _i2.SortOrder sort;

  final String search;

  @override
  Map<String, dynamic> toJson() => {
        'fields': fields,
        'sort': sort,
        'search': search,
      };
}

class UserOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserOrderByWithRelationInput({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.posts,
    this.$relevance,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? email;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? name;

  final _i2.SortOrder? password;

  final _i2.SortOrder? role;

  final _i2.SortOrder? createdAt;

  final _i2.SortOrder? updatedAt;

  final _i2.PostOrderByRelationAggregateInput? posts;

  final _i2.UserOrderByRelevanceInput? $relevance;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'posts': posts,
        '_relevance': $relevance,
      };
}

enum PostOrderByRelevanceFieldEnum implements _i1.PrismaEnum {
  title._('title'),
  content._('content'),
  imageUrl._('imageUrl');

  const PostOrderByRelevanceFieldEnum._(this.name);

  @override
  final String name;
}

class PostOrderByRelevanceInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostOrderByRelevanceInput({
    required this.fields,
    required this.sort,
    required this.search,
  });

  final _i1.PrismaUnion<_i2.PostOrderByRelevanceFieldEnum,
      Iterable<_i2.PostOrderByRelevanceFieldEnum>> fields;

  final _i2.SortOrder sort;

  final String search;

  @override
  Map<String, dynamic> toJson() => {
        'fields': fields,
        'sort': sort,
        'search': search,
      };
}

class PostOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostOrderByWithRelationInput({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
    this.author,
    this.$relevance,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? content;

  final _i2.SortOrder? published;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? imageUrl;

  final _i2.SortOrder? createdAt;

  final _i2.SortOrder? updatedAt;

  final _i2.SortOrder? authorId;

  final _i2.UserOrderByWithRelationInput? author;

  final _i2.PostOrderByRelevanceInput? $relevance;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
        'author': author,
        '_relevance': $relevance,
      };
}

class PostWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
    this.author,
  });

  final int? id;

  final _i1.PrismaUnion<_i2.PostWhereInput, Iterable<_i2.PostWhereInput>>? AND;

  final Iterable<_i2.PostWhereInput>? OR;

  final _i1.PrismaUnion<_i2.PostWhereInput, Iterable<_i2.PostWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? title;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<_i2.BoolFilter, bool>? published;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? createdAt;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? updatedAt;

  final _i1.PrismaUnion<_i2.IntFilter, int>? authorId;

  final _i1.PrismaUnion<_i2.UserScalarRelationFilter, _i2.UserWhereInput>?
      author;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
        'author': author,
      };
}

enum PostScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'Post'),
  title<String>('title', 'Post'),
  content<String>('content', 'Post'),
  published<bool>('published', 'Post'),
  imageUrl<String>('imageUrl', 'Post'),
  createdAt<DateTime>('createdAt', 'Post'),
  updatedAt<DateTime>('updatedAt', 'Post'),
  authorId<int>('authorId', 'Post');

  const PostScalar(
    this.name,
    this.model,
  );

  @override
  final String name;

  @override
  final String model;
}

class UserPostsArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserPostsArgs({
    this.where,
    this.orderBy,
    this.cursor,
    this.take,
    this.skip,
    this.distinct,
    this.select,
    this.include,
  });

  final _i2.PostWhereInput? where;

  final _i1.PrismaUnion<Iterable<_i2.PostOrderByWithRelationInput>,
      _i2.PostOrderByWithRelationInput>? orderBy;

  final _i2.PostWhereUniqueInput? cursor;

  final int? take;

  final int? skip;

  final _i1.PrismaUnion<_i2.PostScalar, Iterable<_i2.PostScalar>>? distinct;

  final _i2.PostSelect? select;

  final _i2.PostInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'orderBy': orderBy,
        'cursor': cursor,
        'take': take,
        'skip': skip,
        'distinct': distinct,
        'select': select,
        'include': include,
      };
}

class UserCountOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCountOutputTypeSelect({this.posts});

  final bool? posts;

  @override
  Map<String, dynamic> toJson() => {'posts': posts};
}

class UserCountArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCountArgs({this.select});

  final _i2.UserCountOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserInclude({
    this.posts,
    this.$count,
  });

  final _i1.PrismaUnion<bool, _i2.UserPostsArgs>? posts;

  final _i1.PrismaUnion<bool, _i2.UserCountArgs>? $count;

  @override
  Map<String, dynamic> toJson() => {
        'posts': posts,
        '_count': $count,
      };
}

class PostSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostSelect({
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

  final bool? id;

  final bool? title;

  final bool? content;

  final bool? published;

  final bool? imageUrl;

  final bool? createdAt;

  final bool? updatedAt;

  final bool? authorId;

  final _i1.PrismaUnion<bool, _i2.PostAuthorArgs>? author;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
        'author': author,
      };
}

class UserSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserSelect({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.posts,
    this.$count,
  });

  final bool? id;

  final bool? email;

  final bool? name;

  final bool? password;

  final bool? role;

  final bool? createdAt;

  final bool? updatedAt;

  final _i1.PrismaUnion<bool, _i2.UserPostsArgs>? posts;

  final _i1.PrismaUnion<bool, _i2.UserCountArgs>? $count;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'posts': posts,
        '_count': $count,
      };
}

enum UserScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'User'),
  email<String>('email', 'User'),
  name$<String>('name', 'User'),
  password<String>('password', 'User'),
  role<String>('role', 'User'),
  createdAt<DateTime>('createdAt', 'User'),
  updatedAt<DateTime>('updatedAt', 'User');

  const UserScalar(
    this.name,
    this.model,
  );

  @override
  final String name;

  @override
  final String model;
}

class PostCreateWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostCreateWithoutAuthorInput({
    required this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  final String title;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? content;

  final bool? published;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class PostUncheckedCreateWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUncheckedCreateWithoutAuthorInput({
    this.id,
    required this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;

  final String title;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? content;

  final bool? published;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class PostCreateOrConnectWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostCreateOrConnectWithoutAuthorInput({
    required this.where,
    required this.create,
  });

  final _i2.PostWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.PostCreateWithoutAuthorInput,
      _i2.PostUncheckedCreateWithoutAuthorInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'create': create,
      };
}

class PostCreateManyAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostCreateManyAuthorInput({
    this.id,
    required this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;

  final String title;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? content;

  final bool? published;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class PostCreateManyAuthorInputEnvelope
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostCreateManyAuthorInputEnvelope({
    required this.data,
    this.skipDuplicates,
  });

  final _i1.PrismaUnion<_i2.PostCreateManyAuthorInput,
      Iterable<_i2.PostCreateManyAuthorInput>> data;

  final bool? skipDuplicates;

  @override
  Map<String, dynamic> toJson() => {
        'data': data,
        'skipDuplicates': skipDuplicates,
      };
}

class PostCreateNestedManyWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostCreateNestedManyWithoutAuthorInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
      _i2.PostCreateWithoutAuthorInput,
      _i1.PrismaUnion<
          Iterable<_i2.PostCreateWithoutAuthorInput>,
          _i1.PrismaUnion<_i2.PostUncheckedCreateWithoutAuthorInput,
              Iterable<_i2.PostUncheckedCreateWithoutAuthorInput>>>>? create;

  final _i1.PrismaUnion<_i2.PostCreateOrConnectWithoutAuthorInput,
      Iterable<_i2.PostCreateOrConnectWithoutAuthorInput>>? connectOrCreate;

  final _i2.PostCreateManyAuthorInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.PostWhereUniqueInput,
      Iterable<_i2.PostWhereUniqueInput>>? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'createMany': createMany,
        'connect': connect,
      };
}

class UserCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCreateInput({
    required this.email,
    this.name,
    required this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.posts,
  });

  final String email;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? name;

  final String password;

  final String? role;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final _i2.PostCreateNestedManyWithoutAuthorInput? posts;

  @override
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'posts': posts,
      };
}

class PostUncheckedCreateNestedManyWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUncheckedCreateNestedManyWithoutAuthorInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
      _i2.PostCreateWithoutAuthorInput,
      _i1.PrismaUnion<
          Iterable<_i2.PostCreateWithoutAuthorInput>,
          _i1.PrismaUnion<_i2.PostUncheckedCreateWithoutAuthorInput,
              Iterable<_i2.PostUncheckedCreateWithoutAuthorInput>>>>? create;

  final _i1.PrismaUnion<_i2.PostCreateOrConnectWithoutAuthorInput,
      Iterable<_i2.PostCreateOrConnectWithoutAuthorInput>>? connectOrCreate;

  final _i2.PostCreateManyAuthorInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.PostWhereUniqueInput,
      Iterable<_i2.PostWhereUniqueInput>>? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'createMany': createMany,
        'connect': connect,
      };
}

class UserUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUncheckedCreateInput({
    this.id,
    required this.email,
    this.name,
    required this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.posts,
  });

  final int? id;

  final String email;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? name;

  final String password;

  final String? role;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final _i2.PostUncheckedCreateNestedManyWithoutAuthorInput? posts;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'posts': posts,
      };
}

class AffectedRowsOutput {
  const AffectedRowsOutput({this.count});

  factory AffectedRowsOutput.fromJson(Map json) =>
      AffectedRowsOutput(count: json['count']);

  final int? count;

  Map<String, dynamic> toJson() => {'count': count};
}

class UserCreateManyInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCreateManyInput({
    this.id,
    required this.email,
    this.name,
    required this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;

  final String email;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? name;

  final String password;

  final String? role;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class StringFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringFieldUpdateOperationsInput({this.set});

  final String? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class NullableStringFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NullableStringFieldUpdateOperationsInput({this.set});

  final _i1.PrismaUnion<String, _i1.PrismaNull>? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class DateTimeFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeFieldUpdateOperationsInput({this.set});

  final DateTime? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class BoolFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const BoolFieldUpdateOperationsInput({this.set});

  final bool? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class PostUpdateWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUpdateWithoutAuthorInput({
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<bool, _i2.BoolFieldUpdateOperationsInput>? published;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class IntFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  final int? set;

  final int? increment;

  final int? decrement;

  final int? multiply;

  final int? divide;

  @override
  Map<String, dynamic> toJson() => {
        'set': set,
        'increment': increment,
        'decrement': decrement,
        'multiply': multiply,
        'divide': divide,
      };
}

class PostUncheckedUpdateWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUncheckedUpdateWithoutAuthorInput({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<bool, _i2.BoolFieldUpdateOperationsInput>? published;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class PostUpsertWithWhereUniqueWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUpsertWithWhereUniqueWithoutAuthorInput({
    required this.where,
    required this.update,
    required this.create,
  });

  final _i2.PostWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.PostUpdateWithoutAuthorInput,
      _i2.PostUncheckedUpdateWithoutAuthorInput> update;

  final _i1.PrismaUnion<_i2.PostCreateWithoutAuthorInput,
      _i2.PostUncheckedCreateWithoutAuthorInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'update': update,
        'create': create,
      };
}

class PostUpdateWithWhereUniqueWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUpdateWithWhereUniqueWithoutAuthorInput({
    required this.where,
    required this.data,
  });

  final _i2.PostWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.PostUpdateWithoutAuthorInput,
      _i2.PostUncheckedUpdateWithoutAuthorInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class PostScalarWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  final _i1.PrismaUnion<_i2.PostScalarWhereInput,
      Iterable<_i2.PostScalarWhereInput>>? AND;

  final Iterable<_i2.PostScalarWhereInput>? OR;

  final _i1.PrismaUnion<_i2.PostScalarWhereInput,
      Iterable<_i2.PostScalarWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? title;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<_i2.BoolFilter, bool>? published;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? createdAt;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? updatedAt;

  final _i1.PrismaUnion<_i2.IntFilter, int>? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class PostUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUpdateManyMutationInput({
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<bool, _i2.BoolFieldUpdateOperationsInput>? published;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class PostUncheckedUpdateManyWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUncheckedUpdateManyWithoutAuthorInput({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<bool, _i2.BoolFieldUpdateOperationsInput>? published;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class PostUpdateManyWithWhereWithoutAuthorInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUpdateManyWithWhereWithoutAuthorInput({
    required this.where,
    required this.data,
  });

  final _i2.PostScalarWhereInput where;

  final _i1.PrismaUnion<_i2.PostUpdateManyMutationInput,
      _i2.PostUncheckedUpdateManyWithoutAuthorInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class PostUpdateManyWithoutAuthorNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUpdateManyWithoutAuthorNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
      _i2.PostCreateWithoutAuthorInput,
      _i1.PrismaUnion<
          Iterable<_i2.PostCreateWithoutAuthorInput>,
          _i1.PrismaUnion<_i2.PostUncheckedCreateWithoutAuthorInput,
              Iterable<_i2.PostUncheckedCreateWithoutAuthorInput>>>>? create;

  final _i1.PrismaUnion<_i2.PostCreateOrConnectWithoutAuthorInput,
      Iterable<_i2.PostCreateOrConnectWithoutAuthorInput>>? connectOrCreate;

  final _i1.PrismaUnion<_i2.PostUpsertWithWhereUniqueWithoutAuthorInput,
      Iterable<_i2.PostUpsertWithWhereUniqueWithoutAuthorInput>>? upsert;

  final _i2.PostCreateManyAuthorInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.PostWhereUniqueInput,
      Iterable<_i2.PostWhereUniqueInput>>? set;

  final _i1.PrismaUnion<_i2.PostWhereUniqueInput,
      Iterable<_i2.PostWhereUniqueInput>>? disconnect;

  final _i1.PrismaUnion<_i2.PostWhereUniqueInput,
      Iterable<_i2.PostWhereUniqueInput>>? delete;

  final _i1.PrismaUnion<_i2.PostWhereUniqueInput,
      Iterable<_i2.PostWhereUniqueInput>>? connect;

  final _i1.PrismaUnion<_i2.PostUpdateWithWhereUniqueWithoutAuthorInput,
      Iterable<_i2.PostUpdateWithWhereUniqueWithoutAuthorInput>>? update;

  final _i1.PrismaUnion<_i2.PostUpdateManyWithWhereWithoutAuthorInput,
      Iterable<_i2.PostUpdateManyWithWhereWithoutAuthorInput>>? updateMany;

  final _i1.PrismaUnion<_i2.PostScalarWhereInput,
      Iterable<_i2.PostScalarWhereInput>>? deleteMany;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'createMany': createMany,
        'set': set,
        'disconnect': disconnect,
        'delete': delete,
        'connect': connect,
        'update': update,
        'updateMany': updateMany,
        'deleteMany': deleteMany,
      };
}

class UserUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpdateInput({
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.posts,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? email;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? password;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? role;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  final _i2.PostUpdateManyWithoutAuthorNestedInput? posts;

  @override
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'posts': posts,
      };
}

class PostUncheckedUpdateManyWithoutAuthorNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUncheckedUpdateManyWithoutAuthorNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
      _i2.PostCreateWithoutAuthorInput,
      _i1.PrismaUnion<
          Iterable<_i2.PostCreateWithoutAuthorInput>,
          _i1.PrismaUnion<_i2.PostUncheckedCreateWithoutAuthorInput,
              Iterable<_i2.PostUncheckedCreateWithoutAuthorInput>>>>? create;

  final _i1.PrismaUnion<_i2.PostCreateOrConnectWithoutAuthorInput,
      Iterable<_i2.PostCreateOrConnectWithoutAuthorInput>>? connectOrCreate;

  final _i1.PrismaUnion<_i2.PostUpsertWithWhereUniqueWithoutAuthorInput,
      Iterable<_i2.PostUpsertWithWhereUniqueWithoutAuthorInput>>? upsert;

  final _i2.PostCreateManyAuthorInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.PostWhereUniqueInput,
      Iterable<_i2.PostWhereUniqueInput>>? set;

  final _i1.PrismaUnion<_i2.PostWhereUniqueInput,
      Iterable<_i2.PostWhereUniqueInput>>? disconnect;

  final _i1.PrismaUnion<_i2.PostWhereUniqueInput,
      Iterable<_i2.PostWhereUniqueInput>>? delete;

  final _i1.PrismaUnion<_i2.PostWhereUniqueInput,
      Iterable<_i2.PostWhereUniqueInput>>? connect;

  final _i1.PrismaUnion<_i2.PostUpdateWithWhereUniqueWithoutAuthorInput,
      Iterable<_i2.PostUpdateWithWhereUniqueWithoutAuthorInput>>? update;

  final _i1.PrismaUnion<_i2.PostUpdateManyWithWhereWithoutAuthorInput,
      Iterable<_i2.PostUpdateManyWithWhereWithoutAuthorInput>>? updateMany;

  final _i1.PrismaUnion<_i2.PostScalarWhereInput,
      Iterable<_i2.PostScalarWhereInput>>? deleteMany;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'createMany': createMany,
        'set': set,
        'disconnect': disconnect,
        'delete': delete,
        'connect': connect,
        'update': update,
        'updateMany': updateMany,
        'deleteMany': deleteMany,
      };
}

class UserUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUncheckedUpdateInput({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.posts,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? email;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? password;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? role;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  final _i2.PostUncheckedUpdateManyWithoutAuthorNestedInput? posts;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'posts': posts,
      };
}

class UserUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpdateManyMutationInput({
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? email;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? password;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? role;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUncheckedUpdateManyInput({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? email;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? password;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? role;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserCountAggregateOutputType {
  const UserCountAggregateOutputType({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.$all,
  });

  factory UserCountAggregateOutputType.fromJson(Map json) =>
      UserCountAggregateOutputType(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        password: json['password'],
        role: json['role'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        $all: json['_all'],
      );

  final int? id;

  final int? email;

  final int? name;

  final int? password;

  final int? role;

  final int? createdAt;

  final int? updatedAt;

  final int? $all;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '_all': $all,
      };
}

class UserAvgAggregateOutputType {
  const UserAvgAggregateOutputType({this.id});

  factory UserAvgAggregateOutputType.fromJson(Map json) =>
      UserAvgAggregateOutputType(id: json['id']);

  final double? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class UserSumAggregateOutputType {
  const UserSumAggregateOutputType({this.id});

  factory UserSumAggregateOutputType.fromJson(Map json) =>
      UserSumAggregateOutputType(id: json['id']);

  final int? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class UserMinAggregateOutputType {
  const UserMinAggregateOutputType({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory UserMinAggregateOutputType.fromJson(Map json) =>
      UserMinAggregateOutputType(
        id: json['id'],
        email: json['email'],
        name: json['name'],
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
      );

  final int? id;

  final String? email;

  final String? name;

  final String? password;

  final String? role;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}

class UserMaxAggregateOutputType {
  const UserMaxAggregateOutputType({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory UserMaxAggregateOutputType.fromJson(Map json) =>
      UserMaxAggregateOutputType(
        id: json['id'],
        email: json['email'],
        name: json['name'],
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
      );

  final int? id;

  final String? email;

  final String? name;

  final String? password;

  final String? role;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}

class UserGroupByOutputType {
  const UserGroupByOutputType({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory UserGroupByOutputType.fromJson(Map json) => UserGroupByOutputType(
        id: json['id'],
        email: json['email'],
        name: json['name'],
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
        $count: json['_count'] is Map
            ? _i2.UserCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.UserAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.UserSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.UserMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.UserMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final String? email;

  final String? name;

  final String? password;

  final String? role;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final _i2.UserCountAggregateOutputType? $count;

  final _i2.UserAvgAggregateOutputType? $avg;

  final _i2.UserSumAggregateOutputType? $sum;

  final _i2.UserMinAggregateOutputType? $min;

  final _i2.UserMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class UserCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCountOrderByAggregateInput({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? email;

  final _i2.SortOrder? name;

  final _i2.SortOrder? password;

  final _i2.SortOrder? role;

  final _i2.SortOrder? createdAt;

  final _i2.SortOrder? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserAvgOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class UserMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserMaxOrderByAggregateInput({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? email;

  final _i2.SortOrder? name;

  final _i2.SortOrder? password;

  final _i2.SortOrder? role;

  final _i2.SortOrder? createdAt;

  final _i2.SortOrder? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserMinOrderByAggregateInput({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? email;

  final _i2.SortOrder? name;

  final _i2.SortOrder? password;

  final _i2.SortOrder? role;

  final _i2.SortOrder? createdAt;

  final _i2.SortOrder? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserSumOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class UserOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserOrderByWithAggregationInput({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? email;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? name;

  final _i2.SortOrder? password;

  final _i2.SortOrder? role;

  final _i2.SortOrder? createdAt;

  final _i2.SortOrder? updatedAt;

  final _i2.UserCountOrderByAggregateInput? $count;

  final _i2.UserAvgOrderByAggregateInput? $avg;

  final _i2.UserMaxOrderByAggregateInput? $max;

  final _i2.UserMinOrderByAggregateInput? $min;

  final _i2.UserSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '_count': $count,
        '_avg': $avg,
        '_max': $max,
        '_min': $min,
        '_sum': $sum,
      };
}

class NestedFloatFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedFloatFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<double, _i1.Reference<double>>? equals;

  final Iterable<double>? $in;

  final Iterable<double>? notIn;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? lt;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? lte;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? gt;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? gte;

  final _i1.PrismaUnion<double, _i2.NestedFloatFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class NestedIntWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedFloatFilter? $avg;

  final _i2.NestedIntFilter? $sum;

  final _i2.NestedIntFilter? $min;

  final _i2.NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class IntWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedFloatFilter? $avg;

  final _i2.NestedIntFilter? $sum;

  final _i2.NestedIntFilter? $min;

  final _i2.NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class NestedStringWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.search,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final String? search;

  final _i1.PrismaUnion<String, _i2.NestedStringWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedStringFilter? $min;

  final _i2.NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'search': search,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class StringWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.search,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final String? search;

  final _i1.PrismaUnion<String, _i2.NestedStringWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedStringFilter? $min;

  final _i2.NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'search': search,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class NestedIntNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1
      .PrismaUnion<int, _i1.PrismaUnion<_i1.Reference<int>, _i1.PrismaNull>>?
      equals;

  final _i1.PrismaUnion<Iterable<int>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<int>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int,
      _i1.PrismaUnion<_i2.NestedIntNullableFilter, _i1.PrismaNull>>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class NestedStringNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.search,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final String? search;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NestedStringNullableWithAggregatesFilter,
          _i1.PrismaNull>>? not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedStringNullableFilter? $min;

  final _i2.NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'search': search,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class StringNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.search,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final String? search;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NestedStringNullableWithAggregatesFilter,
          _i1.PrismaNull>>? not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedStringNullableFilter? $min;

  final _i2.NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'search': search,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class NestedDateTimeWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedDateTimeWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedDateTimeFilter? $min;

  final _i2.NestedDateTimeFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class DateTimeWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedDateTimeFilter? $min;

  final _i2.NestedDateTimeFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class UserScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final _i1.PrismaUnion<_i2.UserScalarWhereWithAggregatesInput,
      Iterable<_i2.UserScalarWhereWithAggregatesInput>>? AND;

  final Iterable<_i2.UserScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<_i2.UserScalarWhereWithAggregatesInput,
      Iterable<_i2.UserScalarWhereWithAggregatesInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? email;

  final _i1.PrismaUnion<_i2.StringNullableWithAggregatesFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? name;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? password;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? role;

  final _i1.PrismaUnion<_i2.DateTimeWithAggregatesFilter, DateTime>? createdAt;

  final _i1.PrismaUnion<_i2.DateTimeWithAggregatesFilter, DateTime>? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCountAggregateOutputTypeSelect({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.$all,
  });

  final bool? id;

  final bool? email;

  final bool? name;

  final bool? password;

  final bool? role;

  final bool? createdAt;

  final bool? updatedAt;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '_all': $all,
      };
}

class UserGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserGroupByOutputTypeCountArgs({this.select});

  final _i2.UserCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserAvgAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class UserGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserGroupByOutputTypeAvgArgs({this.select});

  final _i2.UserAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserSumAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class UserGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserGroupByOutputTypeSumArgs({this.select});

  final _i2.UserSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserMinAggregateOutputTypeSelect({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final bool? id;

  final bool? email;

  final bool? name;

  final bool? password;

  final bool? role;

  final bool? createdAt;

  final bool? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserGroupByOutputTypeMinArgs({this.select});

  final _i2.UserMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserMaxAggregateOutputTypeSelect({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final bool? id;

  final bool? email;

  final bool? name;

  final bool? password;

  final bool? role;

  final bool? createdAt;

  final bool? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserGroupByOutputTypeMaxArgs({this.select});

  final _i2.UserMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserGroupByOutputTypeSelect({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? email;

  final bool? name;

  final bool? password;

  final bool? role;

  final bool? createdAt;

  final bool? updatedAt;

  final _i1.PrismaUnion<bool, _i2.UserGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.UserGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.UserGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.UserGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.UserGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class AggregateUser {
  const AggregateUser({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateUser.fromJson(Map json) => AggregateUser(
        $count: json['_count'] is Map
            ? _i2.UserCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.UserAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.UserSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.UserMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.UserMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final _i2.UserCountAggregateOutputType? $count;

  final _i2.UserAvgAggregateOutputType? $avg;

  final _i2.UserSumAggregateOutputType? $sum;

  final _i2.UserMinAggregateOutputType? $min;

  final _i2.UserMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class AggregateUserCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserCountArgs({this.select});

  final _i2.UserCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserAvgArgs({this.select});

  final _i2.UserAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserSumArgs({this.select});

  final _i2.UserSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserMinArgs({this.select});

  final _i2.UserMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserMaxArgs({this.select});

  final _i2.UserMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateUserCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateUserAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateUserSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateUserMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateUserMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class UserCreateWithoutPostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCreateWithoutPostsInput({
    required this.email,
    this.name,
    required this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final String email;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? name;

  final String password;

  final String? role;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserUncheckedCreateWithoutPostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUncheckedCreateWithoutPostsInput({
    this.id,
    required this.email,
    this.name,
    required this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;

  final String email;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? name;

  final String password;

  final String? role;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserCreateOrConnectWithoutPostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCreateOrConnectWithoutPostsInput({
    required this.where,
    required this.create,
  });

  final _i2.UserWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.UserCreateWithoutPostsInput,
      _i2.UserUncheckedCreateWithoutPostsInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'create': create,
      };
}

class UserCreateNestedOneWithoutPostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCreateNestedOneWithoutPostsInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  final _i1.PrismaUnion<_i2.UserCreateWithoutPostsInput,
      _i2.UserUncheckedCreateWithoutPostsInput>? create;

  final _i2.UserCreateOrConnectWithoutPostsInput? connectOrCreate;

  final _i2.UserWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'connect': connect,
      };
}

class PostCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostCreateInput({
    required this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    required this.author,
  });

  final String title;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? content;

  final bool? published;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final _i2.UserCreateNestedOneWithoutPostsInput author;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'author': author,
      };
}

class PostUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUncheckedCreateInput({
    this.id,
    required this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    required this.authorId,
  });

  final int? id;

  final String title;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? content;

  final bool? published;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final int authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class PostCreateManyInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostCreateManyInput({
    this.id,
    required this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    required this.authorId,
  });

  final int? id;

  final String title;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? content;

  final bool? published;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final int authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class UserUpdateWithoutPostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpdateWithoutPostsInput({
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? email;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? password;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? role;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserUncheckedUpdateWithoutPostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUncheckedUpdateWithoutPostsInput({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? email;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? password;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? role;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserUpsertWithoutPostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpsertWithoutPostsInput({
    required this.update,
    required this.create,
    this.where,
  });

  final _i1.PrismaUnion<_i2.UserUpdateWithoutPostsInput,
      _i2.UserUncheckedUpdateWithoutPostsInput> update;

  final _i1.PrismaUnion<_i2.UserCreateWithoutPostsInput,
      _i2.UserUncheckedCreateWithoutPostsInput> create;

  final _i2.UserWhereInput? where;

  @override
  Map<String, dynamic> toJson() => {
        'update': update,
        'create': create,
        'where': where,
      };
}

class UserUpdateToOneWithWhereWithoutPostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpdateToOneWithWhereWithoutPostsInput({
    this.where,
    required this.data,
  });

  final _i2.UserWhereInput? where;

  final _i1.PrismaUnion<_i2.UserUpdateWithoutPostsInput,
      _i2.UserUncheckedUpdateWithoutPostsInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class UserUpdateOneRequiredWithoutPostsNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpdateOneRequiredWithoutPostsNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  final _i1.PrismaUnion<_i2.UserCreateWithoutPostsInput,
      _i2.UserUncheckedCreateWithoutPostsInput>? create;

  final _i2.UserCreateOrConnectWithoutPostsInput? connectOrCreate;

  final _i2.UserUpsertWithoutPostsInput? upsert;

  final _i2.UserWhereUniqueInput? connect;

  final _i1.PrismaUnion<
      _i2.UserUpdateToOneWithWhereWithoutPostsInput,
      _i1.PrismaUnion<_i2.UserUpdateWithoutPostsInput,
          _i2.UserUncheckedUpdateWithoutPostsInput>>? update;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'connect': connect,
        'update': update,
      };
}

class PostUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUpdateInput({
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.author,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<bool, _i2.BoolFieldUpdateOperationsInput>? published;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  final _i2.UserUpdateOneRequiredWithoutPostsNestedInput? author;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'author': author,
      };
}

class PostUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUncheckedUpdateInput({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<bool, _i2.BoolFieldUpdateOperationsInput>? published;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class PostUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostUncheckedUpdateManyInput({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<bool, _i2.BoolFieldUpdateOperationsInput>? published;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      createdAt;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      updatedAt;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class PostCountAggregateOutputType {
  const PostCountAggregateOutputType({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
    this.$all,
  });

  factory PostCountAggregateOutputType.fromJson(Map json) =>
      PostCountAggregateOutputType(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        published: json['published'],
        imageUrl: json['imageUrl'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        authorId: json['authorId'],
        $all: json['_all'],
      );

  final int? id;

  final int? title;

  final int? content;

  final int? published;

  final int? imageUrl;

  final int? createdAt;

  final int? updatedAt;

  final int? authorId;

  final int? $all;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
        '_all': $all,
      };
}

class PostAvgAggregateOutputType {
  const PostAvgAggregateOutputType({
    this.id,
    this.authorId,
  });

  factory PostAvgAggregateOutputType.fromJson(Map json) =>
      PostAvgAggregateOutputType(
        id: json['id'],
        authorId: json['authorId'],
      );

  final double? id;

  final double? authorId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
      };
}

class PostSumAggregateOutputType {
  const PostSumAggregateOutputType({
    this.id,
    this.authorId,
  });

  factory PostSumAggregateOutputType.fromJson(Map json) =>
      PostSumAggregateOutputType(
        id: json['id'],
        authorId: json['authorId'],
      );

  final int? id;

  final int? authorId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
      };
}

class PostMinAggregateOutputType {
  const PostMinAggregateOutputType({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  factory PostMinAggregateOutputType.fromJson(Map json) =>
      PostMinAggregateOutputType(
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
      );

  final int? id;

  final String? title;

  final String? content;

  final bool? published;

  final String? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final int? authorId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'authorId': authorId,
      };
}

class PostMaxAggregateOutputType {
  const PostMaxAggregateOutputType({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  factory PostMaxAggregateOutputType.fromJson(Map json) =>
      PostMaxAggregateOutputType(
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
      );

  final int? id;

  final String? title;

  final String? content;

  final bool? published;

  final String? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final int? authorId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'authorId': authorId,
      };
}

class PostGroupByOutputType {
  const PostGroupByOutputType({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory PostGroupByOutputType.fromJson(Map json) => PostGroupByOutputType(
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
        $count: json['_count'] is Map
            ? _i2.PostCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.PostAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.PostSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.PostMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.PostMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final String? title;

  final String? content;

  final bool? published;

  final String? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final int? authorId;

  final _i2.PostCountAggregateOutputType? $count;

  final _i2.PostAvgAggregateOutputType? $avg;

  final _i2.PostSumAggregateOutputType? $sum;

  final _i2.PostMinAggregateOutputType? $min;

  final _i2.PostMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'authorId': authorId,
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class PostCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostCountOrderByAggregateInput({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? content;

  final _i2.SortOrder? published;

  final _i2.SortOrder? imageUrl;

  final _i2.SortOrder? createdAt;

  final _i2.SortOrder? updatedAt;

  final _i2.SortOrder? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class PostAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostAvgOrderByAggregateInput({
    this.id,
    this.authorId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
      };
}

class PostMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostMaxOrderByAggregateInput({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? content;

  final _i2.SortOrder? published;

  final _i2.SortOrder? imageUrl;

  final _i2.SortOrder? createdAt;

  final _i2.SortOrder? updatedAt;

  final _i2.SortOrder? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class PostMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostMinOrderByAggregateInput({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? content;

  final _i2.SortOrder? published;

  final _i2.SortOrder? imageUrl;

  final _i2.SortOrder? createdAt;

  final _i2.SortOrder? updatedAt;

  final _i2.SortOrder? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class PostSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostSumOrderByAggregateInput({
    this.id,
    this.authorId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
      };
}

class PostOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostOrderByWithAggregationInput({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? content;

  final _i2.SortOrder? published;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? imageUrl;

  final _i2.SortOrder? createdAt;

  final _i2.SortOrder? updatedAt;

  final _i2.SortOrder? authorId;

  final _i2.PostCountOrderByAggregateInput? $count;

  final _i2.PostAvgOrderByAggregateInput? $avg;

  final _i2.PostMaxOrderByAggregateInput? $max;

  final _i2.PostMinOrderByAggregateInput? $min;

  final _i2.PostSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
        '_count': $count,
        '_avg': $avg,
        '_max': $max,
        '_min': $min,
        '_sum': $sum,
      };
}

class NestedBoolWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedBoolWithAggregatesFilter({
    this.equals,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i1.Reference<bool>>? equals;

  final _i1.PrismaUnion<bool, _i2.NestedBoolWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedBoolFilter? $min;

  final _i2.NestedBoolFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class BoolWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const BoolWithAggregatesFilter({
    this.equals,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i1.Reference<bool>>? equals;

  final _i1.PrismaUnion<bool, _i2.NestedBoolWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedBoolFilter? $min;

  final _i2.NestedBoolFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class PostScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  final _i1.PrismaUnion<_i2.PostScalarWhereWithAggregatesInput,
      Iterable<_i2.PostScalarWhereWithAggregatesInput>>? AND;

  final Iterable<_i2.PostScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<_i2.PostScalarWhereWithAggregatesInput,
      Iterable<_i2.PostScalarWhereWithAggregatesInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? title;

  final _i1.PrismaUnion<_i2.StringNullableWithAggregatesFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? content;

  final _i1.PrismaUnion<_i2.BoolWithAggregatesFilter, bool>? published;

  final _i1.PrismaUnion<_i2.StringNullableWithAggregatesFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? imageUrl;

  final _i1.PrismaUnion<_i2.DateTimeWithAggregatesFilter, DateTime>? createdAt;

  final _i1.PrismaUnion<_i2.DateTimeWithAggregatesFilter, DateTime>? updatedAt;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class PostCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostCountAggregateOutputTypeSelect({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
    this.$all,
  });

  final bool? id;

  final bool? title;

  final bool? content;

  final bool? published;

  final bool? imageUrl;

  final bool? createdAt;

  final bool? updatedAt;

  final bool? authorId;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
        '_all': $all,
      };
}

class PostGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostGroupByOutputTypeCountArgs({this.select});

  final _i2.PostCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostAvgAggregateOutputTypeSelect({
    this.id,
    this.authorId,
  });

  final bool? id;

  final bool? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
      };
}

class PostGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostGroupByOutputTypeAvgArgs({this.select});

  final _i2.PostAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostSumAggregateOutputTypeSelect({
    this.id,
    this.authorId,
  });

  final bool? id;

  final bool? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
      };
}

class PostGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostGroupByOutputTypeSumArgs({this.select});

  final _i2.PostSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostMinAggregateOutputTypeSelect({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  final bool? id;

  final bool? title;

  final bool? content;

  final bool? published;

  final bool? imageUrl;

  final bool? createdAt;

  final bool? updatedAt;

  final bool? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class PostGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostGroupByOutputTypeMinArgs({this.select});

  final _i2.PostMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostMaxAggregateOutputTypeSelect({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
  });

  final bool? id;

  final bool? title;

  final bool? content;

  final bool? published;

  final bool? imageUrl;

  final bool? createdAt;

  final bool? updatedAt;

  final bool? authorId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
      };
}

class PostGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostGroupByOutputTypeMaxArgs({this.select});

  final _i2.PostMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostGroupByOutputTypeSelect({
    this.id,
    this.title,
    this.content,
    this.published,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.authorId,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? title;

  final bool? content;

  final bool? published;

  final bool? imageUrl;

  final bool? createdAt;

  final bool? updatedAt;

  final bool? authorId;

  final _i1.PrismaUnion<bool, _i2.PostGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.PostGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.PostGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.PostGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.PostGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'published': published,
        'imageUrl': imageUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'authorId': authorId,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class AggregatePost {
  const AggregatePost({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregatePost.fromJson(Map json) => AggregatePost(
        $count: json['_count'] is Map
            ? _i2.PostCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.PostAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.PostSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.PostMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.PostMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final _i2.PostCountAggregateOutputType? $count;

  final _i2.PostAvgAggregateOutputType? $avg;

  final _i2.PostSumAggregateOutputType? $sum;

  final _i2.PostMinAggregateOutputType? $min;

  final _i2.PostMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class AggregatePostCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostCountArgs({this.select});

  final _i2.PostCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePostAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostAvgArgs({this.select});

  final _i2.PostAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePostSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostSumArgs({this.select});

  final _i2.PostSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePostMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostMinArgs({this.select});

  final _i2.PostMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePostMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostMaxArgs({this.select});

  final _i2.PostMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePostSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregatePostCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregatePostAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregatePostSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregatePostMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregatePostMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}
