
import 'package:shelf/shelf.dart';
import '../auth/auth_service.dart';
import '../auth/jwt_payload.dart';
import '../helper/client_helper.dart';
import '../src/generated_prisma_client/client.dart'; // For PrismaClient access
import '../src/generated_prisma_client/model.dart'; // For User model
import 'dart:convert';

import '../src/generated_prisma_client/prisma.dart' show UserWhereUniqueInput;

/// Key to store the authenticated User object in the RequestContext.
const String authenticatedUserKey = 'authenticatedUser';

/// Middleware to authenticate requests using JWT.
/// If authentication is successful, the JwtPayload and the full User object
/// are added to the request context.
Middleware authenticateUser() {
  final AuthService authService = AuthService();

  return (innerHandler) {
    return (request) async {
      final authHeader = request.headers['Authorization'];
      if (authHeader == null || !authHeader.startsWith('Bearer ')) {
        print('Authentication: No Authorization header or invalid format.');
        return Response.unauthorized(jsonEncode({'error': 'Authentication required'}));
      }

      final token = authHeader.substring(7); // Remove 'Bearer ' prefix
      final JwtPayload? payload = authService.verifyJwt(token);

      if (payload == null) {
        print('Authentication: Invalid or expired token.');
        return Response.forbidden(jsonEncode({'error': 'Invalid or expired token'}));
      }

      // Fetch the full User object from the database using the payload's userId
      // This ensures the User object is fresh and has all its properties
      try {
        // final prisma = getPrismaClient(request);
        final client = getPrismaClient(request);

        final User? authenticatedUser = await client.user.findUnique(
          where: UserWhereUniqueInput(id: payload.userId),
        );

        if (authenticatedUser == null) {
          print('Authentication: User from token payload not found in DB.');
          return Response.forbidden(jsonEncode({'error': 'User associated with token not found'}));
        }

        // Add the authenticated User object to the request context
        final updatedContext = Map<String, dynamic>.from(request.context)
          ..[authenticatedUserKey] = authenticatedUser;
        final authenticatedRequest = request.change(context: updatedContext);

        print('Authentication: User ${authenticatedUser.email} authenticated successfully.');
        return await innerHandler(authenticatedRequest);
      } catch (e) {
        print('Authentication: Error fetching user from DB during authentication: $e');
        return Response.internalServerError(body: jsonEncode({'error': 'Authentication failed due to server error'}));
      }
    };
  };
}

/// Helper to get the authenticated User from the request context.
/// Throws a [StateError] if no authenticated user is found (meaning the
/// middleware wasn't applied or authentication failed).
User getAuthenticatedUser(Request request) {
  final user = request.context[authenticatedUserKey];
  if (user is! User) {
    throw StateError('Authenticated user not found in context. Ensure auth middleware is applied.');
  }
  return user;
}