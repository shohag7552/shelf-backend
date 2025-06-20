// lib/routes/posts_route.dart
import 'dart:convert';
import 'dart:io';

import 'package:my_shelf_mysql_app/helper/client_helper.dart';
import 'package:my_shelf_mysql_app/helper/project_helper.dart';
import 'package:my_shelf_mysql_app/src/generated_prisma_client/prisma.dart';
import 'package:orm/orm.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:path/path.dart' as p;


/// Returns a Router that handles CRUD operations for Posts.
///
/// This router includes endpoints for:
/// - GET /posts: Retrieve all posts.
/// - GET /posts/:id: Retrieve a single post by ID.
/// - POST /posts: Create a new post.
/// - PUT /posts/:id: Update an existing post by ID.
/// - DELETE /posts/:id: Delete a post by ID (and its associated image file).
///
/// Authentication/Authorization for specific methods (e.g., POST, PUT, DELETE)
/// should be handled by applying `authenticateUser()` middleware in `bin/server.dart`
/// when mounting this router.
Router getPostsRouter() {
  final router = Router();

  // GET /posts - Retrieve all posts
  // Can be public or protected based on how it's mounted in bin/server.dart
  router.get('/posts', _getAllPosts);

  // GET /posts/:id - Retrieve a single post by ID
  // Can be public or protected based on how it's mounted in bin/server.dart
  router.get('/posts/<id>', _getPostById);

  // POST /posts - Create a new post
  // This route should typically be protected by `authenticateUser()` middleware.
  router.post('/posts', _createPost);

  // PUT /posts/:id - Update an existing post
  // This route should typically be protected by `authenticateUser()` middleware.
  router.put('/posts/<id>', _updatePostById);

  // DELETE /posts/:id - Delete a post
  // This route should typically be protected by `authenticateUser()` middleware.
  router.delete('/posts/<id>', _deletePostById);

  return router;
}

Future<Response> _getAllPosts(Request request) async {
  final prisma = getPrismaClient(request);
  try {
    // Optional: Include author details if query parameter 'includeAuthor' is 'true'
    final includeAuthor = request.url.queryParameters['includeAuthor'] == 'true';
    final userId = request.url.queryParameters['user_id'];
    final limit = int.tryParse(request.url.queryParameters['limit'] ?? '10') ?? 10;
    final offset = int.tryParse(request.url.queryParameters['offset'] ?? '0') ?? 0;
    final skip = (offset - 1) * limit;

    final posts = await prisma.post.findMany(
      where: userId != null
          ? PostWhereInput(authorId: PrismaUnion.$2(int.parse(userId)))
          : null,
      include: includeAuthor ? PostInclude(author: PrismaUnion.$1(true)) : null,
      take: limit,
      skip: skip,
      orderBy: PrismaUnion.$2(PostOrderByWithRelationInput(createdAt: SortOrder.asc)),
    );

    final ids = await prisma.post.findMany(
      where: userId != null
          ? PostWhereInput(authorId: PrismaUnion.$2(int.parse(userId)))
          : null,
      select: PostSelect(id: true),
    );
    final totalCount = ids.length;

    return Response.ok(
      jsonEncode({
        'meta': {
          'limit': limit,
          'offset': offset,
          'count': posts.length,
          'total': totalCount,
        },
        'data': posts.map((p) => p.toJson()).toList()
      }),
      headers: {'Content-Type': 'application/json'},
    );

  } catch (e, stackTrace) {
    print('Posts: Error fetching all posts: $e');
    print('Posts: Stack trace: $stackTrace');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to fetch posts'}));
  }
}

Future<Response> _getPostById(Request request, String id) async {
  final prisma = getPrismaClient(request);
  try {
    final postId = int.tryParse(id);
    if (postId == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Invalid post ID format'}));
    }

    // Optional: Include author details
    final includeAuthor = request.url.queryParameters['includeAuthor'] == 'true';

    print('======include author: $includeAuthor // ${request.url.queryParameters}');

    final post = await prisma.post.findUnique(
      where: PostWhereUniqueInput(id: postId),
      include: includeAuthor ? PostInclude(author: PrismaUnion.$1(true)) : null,
    );

    if (post == null) {
      print('Posts: Post with ID $postId not found.');
      return Response.notFound(jsonEncode({'error': 'Post not found'}));
    }

    print('Posts: Retrieved post with ID $postId.');
    return Response.ok(jsonEncode(post.toJson()), headers: {'Content-Type': 'application/json'});
  } catch (e, stackTrace) {
    print('Posts: Error fetching post by ID $id: $e');
    print('Posts: Stack trace: $stackTrace');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to fetch post'}));
  }
}

Future<Response> _updatePostById(Request request, String id) async {
  final prisma = getPrismaClient(request);
  // If this router is mounted under `authenticateUser()`, you can get the user like this:
  // final authenticatedUser = getAuthenticatedUser(request);
  // print('Posts: User ${authenticatedUser.email} is updating post ID $id.');

  try {
    final postId = int.tryParse(id);
    if (postId == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Invalid post ID format'}));
    }

    final body = await request.readAsString();
    final Map<String, dynamic> data = jsonDecode(body) as Map<String, dynamic>;

    // Prepare update data, allowing partial updates
    final PostUpdateInput updateInput = PostUpdateInput(
      title: PrismaUnion.$1(data.containsKey('title') && data['title'] != null
          ?  data['title']
          : null),
      content: PrismaUnion.$1(data.containsKey('content')
          ? data['content']
          : null),
      published: PrismaUnion.$1(data.containsKey('published') && data['published'] != null
          ? data['published']
          : null),
      imageUrl: PrismaUnion.$1(data.containsKey('imageUrl')
          ? data['imageUrl']
          : null), // Allow updating image URL, or setting to null
    );

    // Check if any fields are actually being updated
    if (updateInput.title == null &&
        updateInput.content == null &&
        updateInput.published == null &&
        updateInput.imageUrl == null) {
      return Response.badRequest(body: jsonEncode({'error': 'No valid fields provided for update'}));
    }

    final updatedPost = await prisma.post.update(
      where: PostWhereUniqueInput(id: postId),
      data: PrismaUnion.$1(updateInput),
    );

    print('Posts: Updated post with ID ${updatedPost?.id}.');
    return Response.ok(jsonEncode(updatedPost?.toJson()), headers: {'Content-Type': 'application/json'});
  } on PrismaClientKnownRequestError catch (e) {
    if (e.code == 'P2025') {
      return Response.notFound(jsonEncode({'error': 'Post not found for update'}));
    }
    print('Posts: Prisma error updating post: ${e.code} - ${e.message}');
    return Response.internalServerError(body: jsonEncode({'error': 'Database error during post update'}));
  } catch (e, stackTrace) {
    print('Posts: General error updating post: $e');
    print('Posts: Stack trace: $stackTrace');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to update post'}));
  }
}

Future<Response> _deletePostById(Request request, String id) async {
  final prisma = getPrismaClient(request);
  // If this router is mounted under `authenticateUser()`, you can get the user like this:
  // final authenticatedUser = getAuthenticatedUser(request);
  // print('Posts: User ${authenticatedUser.email} is deleting post ID $id.');

  try {
    final postId = int.tryParse(id);
    if (postId == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Invalid post ID format'}));
    }

    // First, retrieve the post to get its image URL (if any)
    final postToDelete = await prisma.post.findUnique(
      where: PostWhereUniqueInput(id: postId),
      select: PostSelect(imageUrl: true), // Only select imageUrl to minimize data transfer
    );

    if (postToDelete == null) {
      return Response.notFound(jsonEncode({'error': 'Post not found for deletion'}));
    }

    // Perform the database deletion
    final deletedPost = await prisma.post.delete(
      where: PostWhereUniqueInput(id: postId),
    );

    // Optional: Delete the actual image file from the disk if it exists
    if (postToDelete.imageUrl != null && postToDelete.imageUrl!.startsWith('/uploads/')) {
      try {
        // Construct the absolute file path from the relative URL
        final filePath = p.join(Directory.current.path, postToDelete.imageUrl!);
        final file = File(filePath);

        if (await file.exists()) {
          await file.delete();
          print('Posts: Successfully deleted image file: ${filePath}');
        } else {
          print('Posts: Image file not found on disk, but URL was in DB: ${filePath}');
        }
      } catch (fileError) {
        print('Posts: Error deleting associated image file for post ID ${deletedPost?.id}: $fileError');
        // Log the error, but don't fail the API request just for file deletion failure
      }
    }

    print('Posts: Deleted post with ID ${deletedPost?.id}.');
    return Response.ok(jsonEncode({'message': 'Deleted post with ID ${deletedPost?.id}.'})); // 204 No Content for successful deletion
  } on PrismaClientKnownRequestError catch (e) {
    if (e.code == 'P2025') {
      return Response.notFound(jsonEncode({'error': 'Post not found for deletion'}));
    }
    print('Posts: Prisma error deleting post: ${e.code} - ${e.message}');
    return Response.internalServerError(body: jsonEncode({'error': 'Database error during post deletion'}));
  } catch (e, stackTrace) {
    print('Posts: General error deleting post: $e');
    print('Posts: Stack trace: $stackTrace');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to delete post'}));
  }
}

Future<Response> _createPost(Request request) async {
  final prisma = getPrismaClient(request);
  String title;
  String? content;
  bool published;
  int authorId;
  String? imageUrl;

  try {
    /*final contentType = request.headers[HttpHeaders.contentTypeHeader];

    if (contentType != null && contentType.contains('application/json')) {
      // Handle JSON request
      print('==== [json]');
      final String body = await request.readAsString();
      final data = jsonDecode(body) as Map<String, dynamic>;

      title = data['title'] ?? (throw Exception('Title is required'));
      content = data['content'];
      published = data['published'] ?? false;
      authorId = data['authorId'] ?? (throw Exception('Author ID is required'));

      imageUrl = data['imageUrl'];
    } else if (contentType != null && contentType.contains('multipart/form-data')) {
      // Handle multipart form data
      print('==== [form-data]');
      final boundary = contentType.split("boundary=").last;
      final transformer = MimeMultipartTransformer(boundary);
      final parts = transformer.bind(request.read());

      final Map<String, String> formFields = {};
      File? imageFile;

      await for (final part in parts) {
        final headers = part.headers;
        final contentDisposition = headers['content-disposition'];
        if (contentDisposition == null) continue;

        final nameMatch = RegExp(r'name="([^"]+)"').firstMatch(contentDisposition);
        final filenameMatch = RegExp(r'filename="([^"]+)"').firstMatch(contentDisposition);

        final name = nameMatch?.group(1);
        final filename = filenameMatch?.group(1);

        final data = await part.fold<List<int>>([], (p, e) => p..addAll(e));

        if (filename == null && name != null) {
          formFields[name] = utf8.decode(data);
        } else if (name == 'image' && filename != null) {
          final uploadsDir = Directory('uploads');
          if (!uploadsDir.existsSync()) uploadsDir.createSync();

          final safeName = '${Uuid().v4()}_${filename.replaceAll(RegExp(r'[^a-zA-Z0-9_.-]'), '_')}';
          final imagePath = p.join(uploadsDir.path, safeName);
          final file = File(imagePath);
          await file.writeAsBytes(data);
          imageFile = file;
        }
      }

      title = formFields['title'] ?? (throw Exception('Title is required'));
      content = formFields['content'];
      published = formFields['published'] == 'true';
      authorId = int.tryParse(formFields['authorId'] ?? '') ?? (throw Exception('Invalid authorId'));

      imageUrl = imageFile?.path;
    } else {
      return Response.badRequest(body: jsonEncode({
        'error': 'Unsupported Content-Type. Use application/json or multipart/form-data.'
      }));
    }*/

    (Map<String, dynamic>, String?) data = await ProjectHelper.generateDataWithMultipart(request);

    Map<String, dynamic> fields = data.$1;
    String? image = data.$2;

    title = fields['title'] ?? (throw Exception('Title is required'));
    content = fields['content'];
    published = fields['published'] == 'true';
    authorId = int.tryParse(fields['authorId'] ?? '') ?? (throw Exception('Invalid authorId'));

    imageUrl = image ?? fields['imageUrl'];

    final newPost = await prisma.post.create(
      data: PrismaUnion.$1(PostCreateInput(
        title: title,
        content: PrismaUnion.$1(content ?? ''),
        published: published,
        imageUrl: PrismaUnion.$1(imageUrl ?? ''),
        author: UserCreateNestedOneWithoutPostsInput(
          connect: UserWhereUniqueInput(id: authorId),
        ),
      )),
      include: PostInclude(author: PrismaUnion.$1(true)),
    );

    return Response.ok(jsonEncode(newPost.toJson()), headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    });
  } catch (e, st) {
    print('Error creating post: $e\n$st');
    return Response.internalServerError(
      body: jsonEncode({'error': 'Failed to create post', 'details': e.toString()}),
    );
  }
}