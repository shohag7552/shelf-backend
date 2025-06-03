import 'dart:convert';
import 'package:my_shelf_mysql_app/src/generated/prisma_client/client.dart';
import 'package:my_shelf_mysql_app/src/generated/prisma_client/prisma.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:orm/orm.dart'; // Import your Prisma client

Router getUserRouter() {
  final router = Router();

  // POST /users - Create a new user
  router.post('/users', (Request request) async {
    final client = request.context['prisma'] as PrismaClient; // Get client from context
    try {
      final body = await request.readAsString();
      final Map<String, dynamic> data = jsonDecode(body) as Map<String, dynamic>;

      final name = data['name'] as String?;
      final email = data['email'] as String?;

      if (email == null) {
        return Response.badRequest(body: jsonEncode({'error': 'Email is required'}));
      }

      // final newUser = await client.user.create(
      //   data: UserCreateInput(
      //     email: email,
      //     name: name, // `name` can be null if not provided
      //   ),
      // );
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
  });

  // GET /users - Fetch all users
  router.get('/users', (Request request) async {
    final client = request.context['prisma'] as PrismaClient;
    try {
      final users = await client.user.findMany();
      return Response.ok(
        jsonEncode(users.map((user) => user.toJson()).toList()),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      print('Error fetching users with ORM: $e');
      return Response.internalServerError(body: jsonEncode({'error': 'Failed to fetch users'}));
    }
  });

  return router;
}