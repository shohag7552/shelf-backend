import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_multipart/shelf_multipart.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:orm/orm.dart';

import '../src/generated_prisma_client/client.dart';
import '../src/generated_prisma_client/prisma.dart'; // Import your Prisma client

Router getUserRouter() {
  final router = Router();

  /// Create a new user
  router.post('/users', _createUser);

  /// Create a new user
  router.post('/image', _imageUploadUser);

  /// upload image
  // router.post('/upload', _uploadUser);

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
        password: '',
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

// Future<Response> _uploadUser(Request request) async {
//   print('--> Received upload request. Content-Type: ${request.headers[HttpHeaders.contentTypeHeader]}');
//
//   // 1. Validate if the request is multipart/form-data
//   if (!request.isMultipart) {
//     print('--- Error: Request is not multipart/form-data. ---');
//     return Response.badRequest(body: jsonEncode({'error': 'Request must be multipart/form-data'}));
//   }
//
//   try {
//     // 2. Parse the multipart data. This will give you a list of FormData parts.
//     final formDataList = await request.multipartFormData.toList();
//     print('--> Received ${formDataList.length} multipart parts.');
//
//     String? uploadedFileUrl; // This will store the relative URL of the saved file
//
//     // 3. Iterate through the parts to find the file(s)
//     for (final formData in formDataList) {
//       print('--> Processing form part: ${formData.name}, Filename: ${formData.filename}');
//
//       // Check if this part is an actual file (identified by a non-null filename)
//       if (formData.filename != null) {
//         final originalFilename = formData.filename!;
//         final contentType = formData.contentType;
//
//         // Optional: Basic validation for image types (e.g., only allow images)
//         if (contentType != null && !contentType.startsWith('image/')) {
//           print('--- Warning: Uploaded file is not an image ($contentType). Skipping. ---');
//           // You might want to return an error here instead of skipping,
//           // depending on your application's requirements.
//           continue; // Skip this part if it's not an image
//         }
//
//         // Read the binary content of the file
//         final bytes = await formData.part.readBytes();
//         print('--> File "${originalFilename}" has ${bytes.length} bytes.');
//
//         // Determine the file extension safely
//         final fileExtension = p.extension(originalFilename);
//         if (fileExtension.isEmpty) {
//           // Fallback for files without extensions, or add more robust mime-type to extension mapping
//           print('--- Warning: File has no extension. Using .bin as fallback. ---');
//         }
//
//         // Generate a unique filename using UUID to prevent collisions and security issues
//         final uniqueFileName = '${uuid.v4()}${fileExtension.isNotEmpty ? fileExtension.toLowerCase() : '.bin'}';
//
//         // Define the directory where images will be stored
//         // 'uploads' is relative to the project root where 'dart run' is executed
//         const String uploadDirectory = 'uploads';
//
//         // Construct the full path to save the file
//         // Directory.current.path gives you the project root (where bin/server.dart is executed from)
//         final filePath = p.join(Directory.current.path, uploadDirectory, uniqueFileName);
//         print('--> Attempting to save file to: $filePath');
//
//         final file = File(filePath);
//
//         // Ensure the target directory exists. Create it recursively if not.
//         final directory = Directory(p.dirname(filePath));
//         if (!await directory.exists()) {
//           await directory.create(recursive: true);
//           print('--> Created directory: ${directory.path}');
//         }
//
//         // Write the file bytes to the disk
//         await file.writeAsBytes(bytes);
//         print('--> File saved successfully to: ${file.path}');
//
//         // Construct the URL path that will be served by shelf_static
//         // This is the path you'll store in your database.
//         uploadedFileUrl = '/$uploadDirectory/$uniqueFileName';
//         print('--> Generated file URL for database/client: $uploadedFileUrl');
//
//         // Assuming only one file upload per request for this example.
//         // If you expect multiple files, remove this break and handle all files.
//         break;
//       } else {
//         // If it's a regular form field (not a file), you can read its string value
//         // String fieldValue = await formData.part.readString();
//         // print('--> Form field ${formData.name}: $fieldValue');
//       }
//     }
//
//     // 4. Return the result to the client
//     if (uploadedFileUrl != null) {
//       return Response.ok(
//         jsonEncode({
//           'message': 'File uploaded successfully',
//           'fileUrl': uploadedFileUrl,
//         }),
//         headers: {'Content-Type': 'application/json'},
//       );
//     } else {
//       print('--- Error: No file part found in the request after processing. ---');
//       return Response.badRequest(body: jsonEncode({'error': 'No file found in the request'}));
//     }
//   } catch (e, stackTrace) {
//     // 5. Comprehensive error handling
//     print('--- CRITICAL ERROR during file upload: $e ---');
//     print('--- Stack trace: $stackTrace ---');
//     return Response.internalServerError(body: jsonEncode({'error': 'Failed to upload file due to server error'}));
//   }
// }
//

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


