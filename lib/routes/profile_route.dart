// lib/routes/profile_route.dart
import 'dart:convert';
import 'package:orm/orm.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../helper/client_helper.dart';
import '../middleware/auth_middleware.dart';
import '../src/generated_prisma_client/model.dart';
import '../src/generated_prisma_client/prisma.dart';

Router getProfileRouter() {
  final router = Router();

  // GET /api/v1/profile - Get the authenticated user's profile
  router.get('/get', _getProfile);

  // PUT /api/v1/profile - Update the authenticated user's profile
  router.put('/update', _updateProfile);

  return router;
}

Future<Response> _getProfile(Request request) async {

  final prisma = getPrismaClient(request);
  final User authenticatedUser = getAuthenticatedUser(request); // This user is guaranteed to be authenticated by middleware

  print('Profile: User ${authenticatedUser.email} is requesting profile.');

  try {
    // You can fetch the user again to ensure fresh data, or just use `authenticatedUser`
    final User? user = await prisma.user.findUnique(
      where: UserWhereUniqueInput(id: authenticatedUser.id),
    );

    if (user == null) {
      // This case should ideally not happen if getAuthenticatedUser succeeded,
      // but it's a good safeguard if the user was deleted between auth and this call.
      print('Profile: Authenticated user not found in DB during profile fetch (id: ${authenticatedUser.id}).');
      return Response.notFound(jsonEncode({'error': 'User profile not found'}));
    }

    // Return profile data (exclude password for security)
    return Response.ok(
      jsonEncode({
        'id': user.id,
        'email': user.email,
        'name': user.name,
        'role': user.role,
        'createdAt': user.createdAt?.toIso8601String(),
        'updatedAt': user.updatedAt?.toIso8601String(),
      }),
      headers: {'Content-Type': 'application/json'},
    );
  } catch (e, stackTrace) {
    print('Profile: Error fetching user profile: $e');
    print('Stack trace: $stackTrace');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to retrieve profile'}));
  }
}

Future<Response> _updateProfile(Request request) async {
  final prisma = getPrismaClient(request);
  final User authenticatedUser = getAuthenticatedUser(request);

  print('Profile: User ${authenticatedUser.email} is attempting to update profile.');

  try {
    final body = await request.readAsString();
    final Map<String, dynamic> data = jsonDecode(body) as Map<String, dynamic>;

    final name = data['name'] as String?;
    final email = data['email'] as String?;
    // Note: Do NOT allow direct password update here.
    // A separate "change password" route is needed for security.

    if (name == null && email == null) {
      return Response.badRequest(body: jsonEncode({'error': 'No fields provided for update'}));
    }

    final updatedUser = await prisma.user.update(
      where: UserWhereUniqueInput(id: authenticatedUser.id),
      data: PrismaUnion.$1(UserUpdateInput(
        name: PrismaUnion.$1(name??''),
        // Only allow email update if it's not changing to an existing email
        email: PrismaUnion.$1(email??''),
        // You might add an explicit email verification flow if email is updated
      )),
    );

    print('Profile: User ${updatedUser?.email} profile updated successfully.');
    return Response.ok(
      jsonEncode({
        'message': 'Profile updated successfully',
        'id': updatedUser?.id,
        'email': updatedUser?.email,
        'name': updatedUser?.name,
        'role': updatedUser?.role,
      }),
      headers: {'Content-Type': 'application/json'},
    );
  } on PrismaClientKnownRequestError catch (e) {
    if (e.code == 'P2002' && e.meta?['target']?.contains('email') == true) {
      print('Profile: Update failed - Email already in use.');
      return Response.forbidden(jsonEncode({'error': 'Email is already taken by another user'}));
    }
    if (e.code == 'P2025') {
      print('Profile: Update failed - User not found in DB (id: ${authenticatedUser.id}).');
      return Response.notFound(jsonEncode({'error': 'User profile not found for update'}));
    }
    print('Profile: Prisma error updating profile: ${e.code} - ${e.message}');
    return Response.internalServerError(body: jsonEncode({'error': 'Database error during profile update'}));
  } catch (e, stackTrace) {
    print('Profile: General error updating profile: $e');
    print('Stack trace: $stackTrace');
    return Response.internalServerError(body: jsonEncode({'error': 'Failed to update profile'}));
  }
}