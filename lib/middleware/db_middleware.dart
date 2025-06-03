import 'package:my_shelf_mysql_app/src/generated/prisma_client/client.dart';
import 'package:shelf/shelf.dart';
// import 'package:orm/orm.dart';
// import 'package:my_shelf_mysql_app/prisma/generated_dart_client/client.dart' as pc;
// import 'prisma/generated_dart_client/client.dart';
// import 'package:my_shelf_mysql_app/route.dart';

Middleware providePrismaClient() {
  // Initialize your PrismaClient once when the server starts
  final client = PrismaClient();

  return (innerHandler) {
    return (Request request) {
      // Attach the PrismaClient to the request context
      return innerHandler(request.change(context: {'prisma': client}));
    };
  };
}