// // lib/routes/post_routes.dart
// import 'dart:convert';
// import 'package:my_shelf_mysql_app/src/generated/prisma_client/client.dart';
// import 'package:my_shelf_mysql_app/src/generated/prisma_client/prisma.dart';
// import 'package:shelf/shelf.dart';
// import 'package:shelf_router/shelf_router.dart';
// import 'package:orm/orm.dart';
//
// Router getPostRouter() {
//   final router = Router();
//
//   // POST /posts - Create a new post
//   router.post('/posts', (Request request) async {
//     final client = request.context['prisma'] as PrismaClient;
//     try {
//       final body = await request.readAsString();
//       final Map<String, dynamic> data = jsonDecode(body) as Map<String, dynamic>;
//
//       final title = data['title'] as String?;
//       final content = data['content'] as String?;
//       final authorId = data['authorId'] as int?; // Important: associate with a user
//       final published = data['published'] as bool? ?? false;
//
//       if (title == null || authorId == null) {
//         return Response.badRequest(
//             body: jsonEncode({'error': 'Title and authorId are required'}));
//       }
//
//       final newPost = await client.post.create(
//         data: PrismaUnion.$1(PostCreateInput(
//           title: title,
//           content: PrismaUnion.$1(content??''),
//           published: published,
//           author: UserRelationInput.connect(
//             UserWhereUniqueInput(id: authorId), // Connect to an existing user by ID
//           ),
//         )),
//       );
//
//       final newUser = await client.user.create(
//         data: PrismaUnion.$1(UserCreateInput(
//           email: email,
//           name: PrismaUnion.$1(name??''),
//         )),
//       );
//       return Response.ok(
//         jsonEncode(newPost.toJson()),
//         headers: {'Content-Type': 'application/json'},
//       );
//     } catch (e) {
//       print('Error creating post with ORM: $e');
//       return Response.internalServerError(body: jsonEncode({'error': 'Failed to create post'}));
//     }
//   });
//
//   // GET /posts - Fetch all posts (optionally with author)
//   router.get('/posts', (Request request) async {
//     final client = request.context['prisma'] as PrismaClient;
//     try {
//       final posts = await client.post.findMany(
//         include: PostInclude(author: true), // Include author data in the response
//       );
//       return Response.ok(
//         jsonEncode(posts.map((post) => post.toJson()).toList()),
//         headers: {'Content-Type': 'application/json'},
//       );
//     } catch (e) {
//       print('Error fetching posts with ORM: $e');
//       return Response.internalServerError(body: jsonEncode({'error': 'Failed to fetch posts'}));
//     }
//   });
//
//   return router;
// }