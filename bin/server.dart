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

  final mainRouter = Router();

  mainRouter.mount('/uploads/', staticFilesHandler);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(providePrismaClient()) // Provides PrismaClient to all routes
      .addMiddleware(corsHeaders()).addHandler(mainRouter.call);
  //     .addHandler((Request request) async {
  //   // if (request.url.pathSegments.isNotEmpty && request.url.pathSegments.first == 'uploads') {
  //   //   print('--> Attempting to serve static file: ${request.url.path} // ${staticFilesHandler}');
  //   //   final staticResponse = await staticFilesHandler(request);
  //   //   print('=====has code: ${staticResponse.statusCode}');
  //   //   if (staticResponse.statusCode != 404) {
  //   //     return staticResponse;
  //   //   }
  //   // }
  //   print('--> Passing request to main application router: ${request.url} // directory : $uploadsDirPath');
  //   if (request.url.pathSegments.isNotEmpty && request.url.pathSegments.first == 'uploads') {
  //
  //   }
  //   //   // print('--> [Server] Attempting to serve static file: "${request.url.path}"'); // Added quotes
  //   //   // final staticResponse = await staticFilesHandler(request);
  //   //   // print('===== [Server] Static handler response status code: ${staticResponse.statusCode}'); // More descriptive
  //   //   // // === THE FIX IS HERE ===
  //   //   // // Get the path segments AFTER 'uploads'
  //   //   // final List<String> remainingPathSegments = request.url.pathSegments.skip(1).toList();
  //   //   //
  //   //   // // Reconstruct the URL without the leading 'uploads' segment
  //   //   // final String newPath = uploadsDirPath +'/'+ remainingPathSegments.join('/');
  //   //   //
  //   //   // print('----> [server] new path is: "$newPath"'); // Added for debugging
  //   //   // final Request staticFileRequest = request.change(path: newPath);
  //   //   // // final Request staticFileRequest = request.change(url: Uri.parse(newPath));
  //   //   //
  //   //   // print('--> [Server] Original URL path: "${request.url.path}"'); // Added for comparison
  //   //   // print('--> [Server] Requesting shelf_static to serve path: "${staticFileRequest.url.path}" from base directory: "$uploadsDirPath"');
  //   //
  //   //   final staticResponse = await staticFilesHandler(staticFileRequest); // Use the modified request!
  //   //   print('===== [Server] Static handler response status code: ${staticResponse.statusCode}');
  //   //
  //   //   if (staticResponse.statusCode != 404) {
  //   //     return staticResponse;
  //   //   }
  //   // }
  //   print('--> [Server] Passing request to main application router: "${request.url.path}"'); // Added quotes
  //
  //   return createRouter()(request);
  // });

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

//
// // Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// // for details. All rights reserved. Use of this source code is governed by a
// // BSD-style license that can be found in the LICENSE file.
//
// import 'dart:io';
// import 'package:args/args.dart';
// import 'package:shelf/shelf.dart' as shelf;
// import 'package:shelf/shelf_io.dart' as io;
// import 'package:shelf_static/shelf_static.dart';
//
// void main(List<String> args) {
//   final parser = _getParser();
//
//   int port;
//   bool logging;
//   bool listDirectories;
//
//   try {
//     final result = parser.parse(args);
//     port = int.parse(result['port'] as String);
//     logging = result['logging'] as bool;
//     listDirectories = result['list-directories'] as bool;
//   } on FormatException catch (e) {
//     stderr
//       ..writeln(e.message)
//       ..writeln(parser.usage);
//     // http://linux.die.net/include/sysexits.h
//     // #define EX_USAGE	64	/* command line usage error */
//     exit(64);
//   }
//
//   if (!FileSystemEntity.isFileSync('bin/server.dart')) {
//     throw StateError('Server expects to be started the '
//         'root of the project.');
//   }
//   var pipeline = const shelf.Pipeline();
//
//   if (logging) {
//     pipeline = pipeline.addMiddleware(shelf.logRequests());
//   }
//
//   String? defaultDoc = _defaultDoc;
//   if (listDirectories) {
//     defaultDoc = null;
//   }
//
//   final handler = pipeline.addHandler(createStaticHandler('uploads',
//       defaultDocument: defaultDoc, listDirectories: listDirectories));
//
//   io.serve(handler, 'localhost', port).then((server) {
//     print('Serving at http://${server.address.host}:${server.port}');
//   });
// }
//
// ArgParser _getParser() => ArgParser()
//   ..addFlag('logging', abbr: 'l', defaultsTo: true)
//   ..addOption('port', abbr: 'p', defaultsTo: '8080')
//   ..addFlag('list-directories',
//       abbr: 'f',
//       negatable: false,
//       help: 'List the files in the source directory instead of serving the '
//           'default document - "$_defaultDoc".');
//
// const _defaultDoc = 'index.html';