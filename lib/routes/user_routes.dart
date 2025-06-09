import 'dart:convert';
import 'dart:io';
import 'package:my_shelf_mysql_app/src/generated/prisma_client/client.dart';
import 'package:my_shelf_mysql_app/src/generated/prisma_client/prisma.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_multipart/shelf_multipart.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:orm/orm.dart'; // Import your Prisma client

Router getUserRouter() {
  final router = Router();

  /// Create a new user
  router.post('/users', _createUser);

  /// Create a new user
  router.post('/image', _imageUploadUser);

  ///Fetch all users
  router.get('/users', _fetchUsers);

  ///Fetch all users
  // router.get('/users/search', _fetchUsersSearch);
  
  ///Get user by ID or unique field
  router.get('/user/<id>', _fetchUsersById);

  ///Update user by ID or unique field
  router.put('/update_user/<id>', _updateUser);

  ///Delete user by ID or unique field
  router.delete('/delete_user/<id>', _deleteUser);
  //
  // router.get('/users/<userId>/posts/<postId>', (Request request, String userId, String postId) {
  //   return Response.ok('Fetching post $postId for user $userId');
  // });
  return router;
}

Future<Response> _createUser(Request request) async {
  final client = request.context['prisma'] as PrismaClient; // Get client from context
  try {
    final body = await request.readAsString();
    final Map<String, dynamic> data = jsonDecode(body) as Map<String, dynamic>;

    final name = data['name'] as String?;
    final email = data['email'] as String?;

    if (email == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Email is required'}));
    }

    final newUser = await client.user.create(
      data: PrismaUnion.$1(UserCreateInput(
        email: email,
        name: PrismaUnion.$1(name??''),
      )),
    );

    return Response.ok(
      jsonEncode(newUser.toJson()), // Use toJson() from generated model
      headers: {'Content-Type': 'application/json'},
    );
  } catch (e) {
    print('Error creating user with ORM: $e');
    // More specific error handling for unique constraint violations etc.
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to create user'}));
  }
}

Future<Response> _fetchUsers(Request request) async {
  final client = request.context['prisma'] as PrismaClient;
  try {
    final users = await client.user.findMany(
      // take: 4, skip: 2,
    );
    return Response.ok(
      jsonEncode(users.map((user) => user.toJson()).toList()),
      headers: {'Content-Type': 'application/json'},
    );
  } catch (e) {
    print('Error fetching users with ORM: $e');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to fetch users'}));
  }
}

Future<Response> _fetchUsersById(Request request, String id) async {
  // print('=====id is : $id');
  final client = request.context['prisma'] as PrismaClient;
  try {
    final userId = int.parse(id);
    final user = await client.user.findUnique(
      where: UserWhereUniqueInput(id: userId),
    );

    if (user == null) {
      return Response.notFound(jsonEncode({'error': 'User not found'}));
    }

    return Response.ok(jsonEncode(user.toJson()), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    print('Error fetching user by ID: $e');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to fetch user'}));
  }
}

///here can't duplicate as it's unique
Future<Response> _updateUser(Request request, String id) async {
  // final prisma = getPrismaClient(request);
  final client = request.context['prisma'] as PrismaClient;

  try {
    final userId = int.tryParse(id);
    if (userId == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Invalid user ID'}));
    }

    final body = await request.readAsString();
    final Map<String, dynamic> data = jsonDecode(body) as Map<String, dynamic>;

    final name = data['name'] as String?;
    final email = data['email'] as String?;

    if (name == null && email == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Name or email must be provided for update'}));
    }

    final updatedUser = await client.user.update(
      where: UserWhereUniqueInput(id: userId),
      data:PrismaUnion.$1(
        UserUpdateInput(
          name: PrismaUnion.$1(name??''),
          email: PrismaUnion.$1(email ??''),
        )
      ) ,
    );
    return Response.ok(jsonEncode(updatedUser?.toJson()), headers: {'Content-Type': 'application/json'});
  } on PrismaClientKnownRequestError catch (e) {
    if (e.code == 'P2025') { // Not Found
      return Response.notFound(jsonEncode({'error': 'Post not found for update'}));
    }
    print('Prisma error updating post: ${e.code} - ${e.message}');
    return Response.internalServerError(body: jsonEncode({'error': 'Database error', 'message': e.message}));
  } catch (e) {
    print('Error updating user: $e');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to update user'}));
  }

}

Future<Response> _deleteUser(Request request, String id) async {
  // final prisma = getPrismaClient(request);
  final client = request.context['prisma'] as PrismaClient;

  try {
    final userId = int.tryParse(id);
    print('=========ggg===> $userId');
    if (userId == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Invalid user ID'}));
    }

    final body = await request.readAsString();
    final Map<String, dynamic> data = jsonDecode(body) as Map<String, dynamic>;

    final name = data['name'] as String?;
    final email = data['email'] as String?;

    if (name == null && email == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Name or email must be provided for update'}));
    }


    final deletedUser = await client.user.delete(
      where: UserWhereUniqueInput(id: userId),
    );

    // Successfully deleted, but no content to return
    // return Response.ok('Successfully Deleted'); // 204 No Content

    return Response.ok(jsonEncode(deletedUser?.toJson()), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    print('Error updating user: $e');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to update user'}));
  }

}

Future<Response> _imageUploadUser(Request request) async {
  // final prisma = getPrismaClient(request);
  final client = request.context['prisma'] as PrismaClient;

  if (request.multipart() case var multipart?) {
    final description = StringBuffer('Regular multipart request\n');
    // final multipart = request.multipart()?.parts;
    // await for (final part in multipart) {
    //   // Headers are available through part.headers as a map:
    //   final headers = part.headers;
    //   // part implements the `Stream<List<int>>` interface which can be used to
    //   // read data. You can also use `part.readBytes()` or `part.readString()`
    // }
    //
    // await for (final part in multipart.parts) {
    //   description.writeln('new part');
    //
    //   part.headers
    //       .forEach((key, value) => description.writeln('Header $key=$value'));
    //   final content = await part.readString();
    //   description.writeln('content: $content');
    //
    //   description.writeln('end of part');
    // }
    //
    // return Response.ok(description.toString());

    final multipart = await request.multipart()?.parts;
    print('======> $multipart');
    // final file = multipart.files['image']; // Assuming 'image' is the field name in your form

    // if (file != null) {
    //   final filename = file.filename;
    //   final bytes = await file.readAsBytes();
    //   final filePath = '/path/to/your/image/directory/${DateTime.now().millisecondsSinceEpoch}_$filename'; // Generate unique filename
    //   final newFile = File(filePath);
    //   await newFile.writeAsBytes(bytes);
    //
    //   // Use your ORM to save filePath to the database
    //   // Example: await myOrm.insertImagePath(filePath, ...);
    //
    //   return Response.ok('Image uploaded successfully');
    // } else {
      return Response.badRequest(body: 'No image file found in the request');
    // }
  } else {
    return Response.badRequest(body: 'Request is not multipart/form-data');
  }

  try {
    final userId = int.tryParse('2');
    print('=========ggg===> $userId');
    if (userId == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Invalid user ID'}));
    }

    final body = await request.readAsString();
    final Map<String, dynamic> data = jsonDecode(body) as Map<String, dynamic>;

    final name = data['name'] as String?;
    final email = data['email'] as String?;

    if (name == null && email == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Name or email must be provided for update'}));
    }


    final deletedUser = await client.user.delete(
      where: UserWhereUniqueInput(id: userId),
    );

    // Successfully deleted, but no content to return
    // return Response.ok('Successfully Deleted'); // 204 No Content

    return Response.ok(jsonEncode(deletedUser?.toJson()), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    print('Error updating user: $e');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to update user'}));
  }

}


