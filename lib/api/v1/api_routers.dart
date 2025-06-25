import 'dart:convert';

import 'package:my_shelf_mysql_app/auth/auth_service.dart';
import 'package:my_shelf_mysql_app/helper/client_helper.dart';
import 'package:my_shelf_mysql_app/helper/project_helper.dart';
import 'package:my_shelf_mysql_app/middleware/auth_middleware.dart';
import 'package:my_shelf_mysql_app/routes/auth_routes.dart';
import 'package:my_shelf_mysql_app/routes/post_routes.dart';
import 'package:my_shelf_mysql_app/src/generated_prisma_client/prisma.dart';
import 'package:orm/orm.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

import '../../routes/profile_route.dart';

/// Creates and configures the main application router.
Router createRouter() {
  final router = Router();
  // // Mount your API routes
  // router.mount('/api/v1/', getUsersRouter().call);
  // router.mount('/api/v1/', getPostsRouter().call);
  //
  // Mount your user routes and post routes
  router.mount('/api/v1/auth', getAuthRouter().call);
  router.mount('/api/v1/', getPostsRouter().call);

  // router.mount('', )

  router.mount(
      '/api/v1/profile',
      // THIS IS WHERE authenticateUser IS APPLIED
      Pipeline()
          .addMiddleware(authenticateUser()) // Apply the authentication middleware
          .addHandler(getProfileRouter().call)); // Then add the handler for profile routes

  // Add a simple root handler
  router.get('/', _registration);

  // Health check endpoint
  router.get('/health', (Request request) => Response.ok('OK'));

  // Fallback for unmatched routes
  router.all('/<ignored|.*>', (Request request) => Response.notFound('Not Found'));

  router.get('/register', (Request request) => Response.ok('OK'));

  return router;
}

Future<Response> _registration(Request request) async {
  print('====[auth] calling===');
  return Response.ok('Hello, Shelf with MySQL and ORM!');
  final prisma = getPrismaClient(request);
  final AuthService authService = AuthService();
  print('Auth: Register attempt. > ${request.method}');

  String? email;
  String? name;
  String? password;
  String? imageUrl;

  try {

    /// You can add image, but make sure you added only image field. other wise image not taken.
    (Map<String, dynamic>, String?) data = await ProjectHelper.generateDataWithMultipart(request);

    Map<String, dynamic> fields = data.$1;
    String? image = data.$2;

    email = fields['email'] as String?;
    password = fields['password'] as String?;
    name = fields['name'] as String?; // Optional
    imageUrl = image ?? fields['imageUrl'];

    print('====[auth] filds are : email: $email, pass: $password, name: $name, image: $image');

    if (email == null || password == null || email.isEmpty || password.isEmpty) {
      return Response.badRequest(body: jsonEncode({'error': 'Email and password are required'}));
    }
    if (password.length < 6) {
      return Response.badRequest(body: jsonEncode({'error': 'Password must be at least 6 characters long'}));
    }

    // Hash the password
    final hashedPassword = authService.hashPassword(password);
    print('====hash password: $hashedPassword');

    // Create user in database
    final newUser = await prisma.user.create(
      data: PrismaUnion.$1(UserCreateInput(
        email: email,
        password: hashedPassword,
        name: PrismaUnion.$1(name??''),
        imageUrl: PrismaUnion.$1(imageUrl??''),
        role: 'USER', // Default role for new users
      )),
    );

    print('Auth: User ${newUser.email} registered successfully.');
    return Response.ok(
      jsonEncode({
        'message': 'User registered successfully',
        'userId': newUser.id,
        'email': newUser.email,
        'url': '${request.url.path}/${newUser.id}',
        'imageUrl': '${newUser.imageUrl}',
      }),
      headers: {'Content-Type': 'application/json'},
    );
  } on PrismaClientKnownRequestError catch (e) {
    if (e.code == 'P2002' && e.meta?['target']?.contains('email') == true) {
      print('Auth: Registration failed - Email already exists.');
      return Response.forbidden(jsonEncode({'error': 'User with this email already exists'}));
    }
    print('Auth: Prisma error during registration: ${e.code} - ${e.message}');
    return Response.internalServerError(body: jsonEncode({'error': 'Database error during registration'}));
  } catch (e, stackTrace) {
    print('Auth: General error during registration: $e');
    print('Stack trace: $stackTrace');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to register user'}));
  }
}