import 'dart:convert';
import 'package:my_shelf_mysql_app/src/generated/prisma_client/client.dart';
import 'package:my_shelf_mysql_app/src/generated/prisma_client/prisma.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:orm/orm.dart'; // Import your Prisma client

Router getUserRouter() {
  final router = Router();

  /// Create a new user
  router.post('/users', _createUser);

  ///Fetch all users
  router.get('/users', _fetchUsers);

  ///Fetch all users
  // router.get('/users/search', _fetchUsersSearch);
  
  ///Get user by ID or unique field
  router.get('/user/<id>', _fetchUsersById);

  ///Update user by ID or unique field
  router.put('/update-user/<id>', _updateUser);

  ///Delete user by ID or unique field
  router.delete('/delete-user/<id>', _deleteUser);
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

Future<Response> _updateUser(Request request, String id) async {
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

    final updatedUser = await client.user.update(
      where: UserWhereUniqueInput(id: userId),
      data:PrismaUnion.$1(
        UserUpdateInput(
          name: PrismaUnion.$1(name??''),
          email: PrismaUnion.$1(email ??''),
        )
      ) ,
      // data: UserUpdateInput(
      //   name: name != null ? StringFieldUpdateOperationsInput(set: name) : null,
      //   email: email != null ? NullableStringFieldUpdateOperationsInput(set: email) : null,
      // ),
      // where: UserWhereUniqueInput(id: userId),
      // data: PrismaUnion.$2(
      //   UserUncheckedUpdateInput(
      //     name: PrismaUnion.$1(name??''),
      //     email: PrismaUnion.$(email??''),
      //   ),
      // ),
      // data: PrismaUnion.$1(UserUpdateInput(
      //   email: PrismaUnion.$1(email??''),
      //   name: PrismaUnion.$1(name??''),
      // )),
    );

    return Response.ok(jsonEncode(updatedUser?.toJson()), headers: {'Content-Type': 'application/json'});
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

