// lib/auth/auth_service.dart
import 'dart:convert';
import 'package:bcrypt/bcrypt.dart'; // Import the bcrypt package
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:uuid/uuid.dart'; // Add Uuid for JWT ID

import '../src/generated_prisma_client/model.dart';
import 'jwt_payload.dart';

/// Service for handling password hashing/verification and JWT operations.
class AuthService {
  final String _jwtSecret;
  final Uuid _uuid = Uuid(); // Instantiate Uuid for JWT IDs

  AuthService()
      : _jwtSecret = 'DEFAULT_SECRET_FOR_DEV_ONLY'; // Use a strong default for dev, but warn!

  /// Hashes a plain-text password using BCrypt.
  /// Throws an exception on hashing failure.
  String hashPassword(String password) {
    // Generate a salt with a cost factor. A cost of 10-12 is common.
    // Higher cost means more CPU time, making brute-force attacks harder,
    // but also slowing down login. Adjust based on your server's capacity.
    final String salt = BCrypt.gensalt(logRounds: 10); // Generates a salt with 10 rounds (2^10 iterations)
    final String hashedPassword = BCrypt.hashpw(password, salt);
    return hashedPassword;
  }

  /// Verifies a plain-text password against a stored BCrypt hash.
  /// Returns true if the password matches, false otherwise.
  bool verifyPassword(String password, String hashedPassword) {
    return BCrypt.checkpw(password, hashedPassword);
  }

  /// Generates a JWT for a given user.
  /// The token expires in 24 hours.
  String generateJwt(User user) {
    final expiry = DateTime.now().add(Duration(hours: 24)); // Token valid for 24 hours
    final claimSet = JwtClaim(
      jwtId: _uuid.v4(), // Unique JWT ID using the _uuid instance
      subject: user.id.toString(), // User ID as subject
      issuer: 'my-shelf-app',
      audience: <String>['my-app-users'],
      otherClaims: JwtPayload(
        userId: user.id!,
        email: user.email!,
        role: user.role!,
      ).toJson(),
      expiry: expiry,
      issuedAt: DateTime.now(),
      notBefore: DateTime.now(),
    );

    final token = issueJwtHS256(claimSet, _jwtSecret);
    return token;
  }

  /// Verifies a JWT and returns the decoded payload if valid, otherwise null.
  JwtPayload? verifyJwt(String token) {
    try {
      JwtClaim claimSet = verifyJwtHS256Signature(token, _jwtSecret);

      // Check if token is expired or not yet valid
      if (claimSet.expiry != null && claimSet.expiry!.isBefore(DateTime.now())) { // isExpired property of JwtClaim can be null. Check it.
        print('JWT is expired.');
        return null;
      }
      if (claimSet.notBefore != null && claimSet.notBefore!.isAfter(DateTime.now())) {
        print('JWT is not yet valid.');
        return null;
      }

      return JwtPayload.fromJson(claimSet.toJson());
    } on JwtException catch (e) {
      print('JWT validation failed: $e');
      return null;
    } catch (e) {
      print('Unexpected error during JWT verification: $e');
      return null;
    }
  }
}
