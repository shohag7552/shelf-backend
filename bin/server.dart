import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:my_shelf_mysql_app/api/v1/api_routers.dart';
import 'package:my_shelf_mysql_app/data_source/mysql_connection.dart';
import 'package:my_shelf_mysql_app/middleware/auth_middleware.dart';
import 'package:my_shelf_mysql_app/middleware/cors_header.dart';
import 'package:my_shelf_mysql_app/middleware/db_middleware.dart';
import 'package:my_shelf_mysql_app/routes/user_routes.dart';
import 'package:my_shelf_mysql_app/src/generated_prisma_client/client.dart';
// import 'package:mysql_client/mysql_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:path/path.dart' as p;
import 'package:shelf_static/shelf_static.dart';


void main(List<String> args) async {

  DotEnv().load();
  final prisma = PrismaClient();

  print('--> Environment variables loaded.');

  final String uploadsDirPath = p.join(Directory.current.path, 'uploads');
  print('--> Configured uploads directory path: $uploadsDirPath');

  final uploadsDir = Directory(uploadsDirPath);
  if (!await uploadsDir.exists()) {
    try {
      await uploadsDir.create(recursive: true);
      print('--> Successfully created uploads directory: ${uploadsDirPath}');
    } catch (e) {
      print('--- CRITICAL ERROR: Failed to create uploads directory at $uploadsDirPath: $e ---');
      exit(1);
    }
  }

  final staticFilesHandler = createStaticHandler(uploadsDirPath, listDirectories: false);


  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(providePrismaClient()) // Provides PrismaClient to all routes
      .addMiddleware(corsHeaders())
      .addHandler((Request request) async {
    if (request.url.pathSegments.isNotEmpty && request.url.pathSegments.first == 'uploads') {
      print('--> Attempting to serve static file: ${request.url.path}');
      final staticResponse = staticFilesHandler(request);
      print('=====has code: ${staticResponse.hashCode}');
      // if (staticResponse.statusCode != 404) {
        return staticResponse;
      // }
    }
    print('--> Passing request to main application router: ${request.url.path}');
    return createRouter()(request);
  });

  final ip = InternetAddress.anyIPv4;
  // final port = int.tryParse(env['PORT'] ?? '8080') ?? 8080;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(handler, ip, port);
  print('Server listening on http://${server.address.host}:${server.port}');

  ProcessSignal.sigint.watch().listen((_) async {
    print('--> Shutting down server gracefully...');
    await server.close(force: true);
    await prisma.$disconnect();
    print('--> Server stopped.');
    exit(0);
  });

}
