// lib/routes/auth_route.dart
import 'dart:convert';
import 'package:my_shelf_mysql_app/auth/auth_service.dart';
import 'package:orm/orm.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../helper/client_helper.dart';
import '../src/generated_prisma_client/client.dart';
import '../src/generated_prisma_client/model.dart';
import '../src/generated_prisma_client/prisma.dart';

Router getAuthRouter() {
  final router = Router();


  // POST /api/v1/auth/register - Register a new user
  router.post('/register', _registration);

  // POST /api/v1/auth/login - Authenticate user and issue JWT
  router.post('/login', _login);

  return router;
}

Future<Response> _registration(Request request) async {
  final prisma = getPrismaClient(request);
  final AuthService authService = AuthService();
  print('Auth: Register attempt. > ${request.method}');

  try {
    final body = await request.readAsString();

    print('=====body : $body');
    final Map<String, dynamic> data = jsonDecode(body) as Map<String, dynamic>;

    final email = data['email'] as String?;
    final password = data['password'] as String?;
    final name = data['name'] as String?; // Optional

    print('====password: $password');

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
        role: 'USER', // Default role for new users
      )),
    );

    print('Auth: User ${newUser.email} registered successfully.');
    return Response.ok(
      // '${request.url.path}/${newUser.id}',
       jsonEncode({
         'message': 'User registered successfully',
         'userId': newUser.id,
         'email': newUser.email,
         'url': '${request.url.path}/${newUser.id}',
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

Future<Response> _login(Request request) async {
  final prisma = getPrismaClient(request);
  final AuthService authService = AuthService();
  print('Auth: Login attempt.');

  try {
    final body = await request.readAsString();
    print('=====body : $body');
    final Map<String, dynamic> data = jsonDecode(body);

    final email = data['email'] as String?;
    final password = data['password'] as String?;

    if (email == null || password == null || email.isEmpty || password.isEmpty) {
      return Response.badRequest(body: jsonEncode({'error': 'Email and password are required'}));
    }

    // Find user by email
    final User? user = await prisma.user.findUnique(
      where: UserWhereUniqueInput(email: email),
    );

    if (user == null) {
      print('Auth: Login failed - User not found.');
      return Response.unauthorized(jsonEncode({'error': 'Invalid credentials'}));
    }

    print('=====pass: $password == ${user.password}');
    // Verify password
    final bool passwordMatches = authService.verifyPassword(password, user.password!);

    if (!passwordMatches) {
      print('Auth: Login failed - Incorrect password.');
      return Response.unauthorized(jsonEncode({'error': 'Invalid credentials'}));
    }

    // Generate JWT
    final String token = authService.generateJwt(user);
    print('Auth: User ${user.email} logged in successfully. Token issued.');
    return Response.ok(
      jsonEncode({'message': 'Login successful', 'token': token}),
      headers: {'Content-Type': 'application/json'},
    );
  } catch (e, stackTrace) {
    print('Auth: General error during login: $e');
    print('Stack trace: $stackTrace');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to log in'}));
  }
}