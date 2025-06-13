class JwtPayload {
  final int userId;
  final String email;
  final String role;

  JwtPayload({
    required this.userId,
    required this.email,
    required this.role,
  });

  /// Creates a JwtPayload from a map (parsed from JWT claims).
  factory JwtPayload.fromJson(Map<String, dynamic> json) {
    return JwtPayload(
      userId: json['userId'] as int,
      email: json['email'] as String,
      role: json['role'] as String,
    );
  }

  /// Converts the JwtPayload to a map for JWT creation.
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'role': role,
    };
  }
}