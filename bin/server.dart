import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:my_shelf_mysql_app/data_source/mysql_connection.dart';
import 'package:my_shelf_mysql_app/middleware/db_middleware.dart';
import 'package:my_shelf_mysql_app/routes/user_routes.dart';
import 'package:my_shelf_mysql_app/src/generated/prisma_client/client.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql1/mysql1.dart';


// Configure routes.
// final _router =
//     Router()
//       ..get('/', _rootHandler)
//       ..get('/echo/<message>', _echoHandler)
//       ..post(, handler);


// Response _rootHandler(Request req) {
//   return Response.ok('Hello, World!\n');
// }
//
// Response _echoHandler(Request request) {
//   final message = request.params['message'];
//   return Response.ok('$message\n');
// }

Future<Response> _getUsersHandler(Request request) async {
  try {
    final connection = await MySQLDatabase.getConnection();
    final result = await connection.execute('SELECT id, name, email FROM names');

    final users = result.rows.map((row) {
      final data = row.assoc();
      return {
        'id': data['id'],
        'name': data['name'],
        'email': data['email'],
      };
    }).toList();

    return Response.ok(
      json.encode(users),
      headers: {'Content-Type': 'application/json'},
    );
  } catch (e) {
    print('Error fetching users: $e');
    return Response.internalServerError(
      body: json.encode({'error': 'Failed to fetch users'}),
      headers: {'Content-Type': 'application/json'},
    );
  }
}

Future<Response> _createUsersHandler(Request request) async {
  try {
    final body = await request.readAsString();
    print('====body: $body');
    final data = json.decode(body) as Map<String, dynamic>;
    final name = data['name'] as String?;
    final email = data['email'] as String?;

    if (name == null || email == null) {
      return Response.badRequest(
        body: json.encode({'error': 'Name and email are required'}),
        headers: {'Content-Type': 'application/json'},
      );
    }

    final connection = await MySQLDatabase.getConnection();
    final result = await connection.execute(
      'INSERT INTO names (id, name, email) VALUES (:id, :name, :email)',
      {'id': '3', 'name': name, 'email': email},
    ).timeout(Duration(seconds: 10));
    // final result2 = await connection.prepare(
    //   'CREATE TABLE IF NOT EXISTS products ('
    //       'id INT AUTO_INCREMENT PRIMARY KEY,'
    //       ' name VARCHAR(255) NOT NULL,'
    //       'price DECIMAL(10, 2) NOT NULL,'
    //       'description TEXT,'
    //       'created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)'
    // ).timeout(Duration(seconds: 10));
    // CREATE TABLE IF NOT EXISTS products (
//             id INT AUTO_INCREMENT PRIMARY KEY,
//             name VARCHAR(255) NOT NULL,
//             price DECIMAL(10, 2) NOT NULL,
//             description TEXT,
//             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
//         );

    print('======last id: ${result.lastInsertID} =====');
    return Response.ok(
      json.encode({'message': 'User created successfully', 'id': result.lastInsertID}),
      headers: {'Content-Type': 'application/json'},
    );
    // return Response.created(
    //   '/users/${result.lastInsertID}', // Example location header
    //   body: json.encode({'message': 'User created successfully', 'id': result.lastInsertID}),
    //   headers: {'Content-Type': 'application/json'},
    // );
  } catch (e) {
    print('Error creating user: $e');
    return Response.internalServerError(
      body: json.encode({'error': 'Failed to create user'}),
      headers: {'Content-Type': 'application/json'},
    );
  }
}

void main(List<String> args) async {

  DotEnv()..load();

  // Initialize the PrismaClient (it will manage its own connections)
  // Ensure this is done once at startup.
  final prisma = PrismaClient();

  // Create a main router
  final router = Router();

  // Mount your user routes and post routes
  router.mount('/api', getUserRouter().call);
  // router.mount('/api', getPostRouter().call); // Mount the post router

  // Add a simple root handler
  router.get('/', (Request request) {
    return Response.ok('Hello, Shelf with MySQL and ORM!');
  });

  // Create a pipeline for middleware and the router
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(providePrismaClient()) // This middleware injects the `prisma` client
      // .addMiddleware(handleCors())
      .addHandler(router);

  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(handler, ip, port);

  print('Serving at http://${server.address.host}:${server.port}');

  // Graceful shutdown
  ProcessSignal.sigint.watch().listen((_) async {
    print('Shutting down server...');
    await server.close();
    await prisma.$disconnect(); // Disconnect PrismaClient on shutdown
    exit(0);
  });
/*
  final ip = InternetAddress.anyIPv4;
// Create a Router
  final _router = Router();

  // Define routes
  _router.get('/users', _getUsersHandler);
  _router.post('/users', _createUsersHandler);

  // A simple handler for the root path
  _router.get('/', (Request request) {
    return Response.ok('Welcome to the Shelf MySQL App!');
  });

  // A basic handler for unknown routes
  _router.all('/<ignored|.*>', (Request request) {
    return Response.notFound('Not Found');
  });

  // Combine multiple handlers into a pipeline.
  // Log requests and errors
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(_router);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port); // Listen on all interfaces
  print('Serving at http://${server.address.host}:${server.port}');

  // Ensure connection is closed when the server shuts down
  ProcessSignal.sigint.watch().listen((_) {
    MySQLDatabase.closeConnection();
    server.close(force: true);
    exit(0);
  });*/






  // load();
  // Use any available host or container IP (usually `0.0.0.0`).
  // final ip = InternetAddress.anyIPv4;

  // final dbSettings = ConnectionSettings(
  //     host: 'localhost',//127.0.0.1,
  //     // host: '127.0.0.1',
  //     port: 8889,
  //     user: 'root',
  //     password: 'root',
  //     db: 'users'
  // );

  // final pool = MySQLConnectionPool(
  //   host: 'localhost',
  //   port: 8889,
  //   userName: 'root',
  //   password: 'root',
  //   maxConnections: 10,
  //   databaseName: 'users', // optional,
  // );
  // final conn = await MySQLConnection.createConnection(
  //   host: "localhost",
  //   port: 8889,
  //   userName: "root",
  //   password: "root",
  //   databaseName: "users", // optional
  // );

// actually connect to database
//   await conn.connect();
//   var result = await conn.execute("SELECT * FROM names WHERE id = :id", {"id": 1});
//
//   for (final row in result.rows) {
//     print(row.assoc());
//   }
  // var settings = new ConnectionSettings(
  //     host: 'localhost',
  //     port: 8889,
  //     user: 'root',
  //     password: 'root',
  //     db: 'users'
  // );
  // var connection = await MySqlConnection.connect(settings);
  // var userId = 1;
  // var results = await connection.query('select name, email from users where id = ?', [userId]);
  // var results = await connection.query('SELECT * FROM names');
  // for (var row in results) {
  //   print('======> ${result.length} rows found');
  // }

  // await connection.close();
//   final _router = Router();
//
//   // Configure a pipeline that logs requests.
//   final handler = Pipeline()
//       .addMiddleware(logRequests())
//       .addHandler(_router.call);
//
//   // === NEW: Database Status Health Check Endpoint ===
//   _router.get('/db-status', (Request request) async {
//     MySqlConnection? conn;
//     try {
//       print('Attempting to connect to database for health check...');
//       conn = await MySqlConnection.connect(dbSettings);
//       print('Successfully established database connection.');
//
//       // Perform a very simple query to ensure the connection is truly active
//       // and permissions allow basic operations.
//       final result = await conn.query('SELECT 1 + 1 AS solution');
//       if (result.isNotEmpty && result.first[0] == 2) {
//         print('Database connection is active and query successful.');
//         return Response.ok(
//           jsonEncode({'status': 'ok', 'message': 'Database connection is healthy.'}),
//           headers: {'Content-Type': 'application/json'},
//         );
//       } else {
//         // This case is unlikely if conn.query succeeds, but good for robustness
//         print('Database query failed for health check (unexpected result).');
//         return Response.internalServerError(
//           body: jsonEncode({'status': 'error', 'message': 'Database query check failed.'}),
//           headers: {'Content-Type': 'application/json'},
//         );
//       }
//     } on MySqlException catch (e) {
//       print('MySQL Error during health check: ${e.message}');
//       String errorMessage;
//       if (e.message.contains('Access denied')) {
//         errorMessage = 'Access denied. Check DB_USER and DB_PASSWORD permissions.';
//       } else if (e.message.contains('Unknown database')) {
//         errorMessage = 'Database "${dbSettings.db}" does not exist.';
//       } else {
//         errorMessage = 'MySQL specific error: ${e.message}';
//       }
//       return Response.internalServerError(
//         body: jsonEncode({'status': 'error', 'message': 'Database connection failed: $errorMessage'}),
//         headers: {'Content-Type': 'application/json'},
//       );
//     } on SocketException catch (e) {
//       print('Socket Error during health check: ${e.message}');
//       return Response.internalServerError(
//         body: jsonEncode({
//           'status': 'error',
//           'message': 'Network error to database: ${e.message}. Is MySQL server running? Is host/port correct? Is firewall blocking?'
//         }),
//         headers: {'Content-Type': 'application/json'},
//       );
//     } catch (e) {
//       print('Unexpected error during health check: $e');
//       return Response.internalServerError(
//         body: jsonEncode({'status': 'error', 'message': 'An unexpected error occurred during DB health check: $e'}),
//         headers: {'Content-Type': 'application/json'},
//       );
//     } finally {
//       await conn?.close(); // Ensure connection is closed
//       print('Database connection closed after health check.');
//     }
//   });
//
//   _router.post('/create-products-table', (Request request) async {
//     MySqlConnection? conn;
//     try {
//       conn = await MySqlConnection.connect(dbSettings);
//
//       // Define your CREATE TABLE SQL statement
//       // Ensure column types, primary keys, and constraints are correct for your needs.
//       // IF NOT EXISTS prevents error if table already exists.
//       const String createTableSQL = '''
//         CREATE TABLE IF NOT EXISTS products (
//             id INT AUTO_INCREMENT PRIMARY KEY,
//             name VARCHAR(255) NOT NULL,
//             price DECIMAL(10, 2) NOT NULL,
//             description TEXT,
//             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
//         );
//       ''';
//
//       await conn.query(createTableSQL);
//
//       return Response.ok(
//         jsonEncode({'message': 'Table "products" created or already exists successfully!'}),
//         headers: {'Content-Type': 'application/json'},
//       );
//     } on MySqlException catch (e) {
//       print('MySQL Error creating table: $e');
//       return Response.internalServerError(
//         body: jsonEncode({'error': 'Failed to create table: ${e.message}'}),
//         headers: {'Content-Type': 'application/json'},
//       );
//     } catch (e) {
//       print('General Error creating table: $e');
//       return Response.internalServerError(
//         body: jsonEncode({'error': 'An unexpected error occurred: $e'}),
//         headers: {'Content-Type': 'application/json'},
//       );
//     } finally {
//       await conn?.close(); // Always close the connection
//     }
//   });
//
//   _router.post('/users', (Request request) async {
//     // print('====> Body: ${request.context['name']}');
//     try {
//
//       final String rawBody = await request.readAsString();
//
//       print('Raw Request Body: "$rawBody"');
// // 2. Get the Content-Type header to determine how to parse the body
//       final contentType = request.headers['content-type'];
//       print('Content-Type: $contentType');
//
//       Map<String, dynamic> parsedBody = {};
//
//       if (contentType != null) {
//         if (contentType.contains('application/json')) {
//           // If JSON, use jsonDecode
//           try {
//             parsedBody = jsonDecode(rawBody) as Map<String, dynamic>;
//             print('Parsed as JSON: $parsedBody');
//           } catch (e) {
//             print('Error parsing JSON: $e');
//             return Response.badRequest(body: 'Invalid JSON format in body.');
//           }
//         } else if (contentType.contains('application/x-www-form-urlencoded')) {
//           // If form-urlencoded, use Uri.splitQueryString
//           parsedBody = Uri.splitQueryString(rawBody);
//           // Note: splitQueryString returns Map<String, String>, cast as needed
//           print('Parsed as URL-encoded form: $parsedBody');
//         } else {
//           return Response.badRequest(body: 'Unsupported Content-Type: $contentType');
//         }
//       } else {
//         // If no Content-Type header, assume empty or malformed request
//         return Response.badRequest(body: 'Content-Type header is missing.');
//       }
//
//       // Access parsed body (from shelf_body_parser middleware)
//       // print('======sss: ${request.method} // ${request.requestedUri.path} // ${request.headers} // ${request.context['params']}//${request.url.pathSegments}');
//       // final body = request.context['parsedBody'] as Map<String, dynamic>?;
//       // print('====22==sss: $body');
//
//       if (parsedBody == null || !parsedBody.containsKey('name') || !parsedBody.containsKey('email')) {
//         return Response.badRequest(body: 'Missing name or email in request body.');
//       }
//
//       final name = parsedBody['name'] as String;
//       final email = parsedBody['email'] as String;
//
//       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
//         return Response.badRequest(body: 'Invalid email format.');
//       }
//
//       print('=====come here====1=====');
//       MySqlConnection? conn;
//       // const String createTableSQL = '''
//       //   CREATE TABLE IF NOT EXISTS products (
//       //       id INT AUTO_INCREMENT PRIMARY KEY,
//       //       name VARCHAR(255) NOT NULL,
//       //       email VARCHAR(255) UNIQUE NOT NULL,
//       //       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
//       //   );
//       // ''';
//
//       const String createTableSQL = '''
//         CREATE TABLE IF NOT EXISTS products (
//             id INT AUTO_INCREMENT PRIMARY KEY,
//             name VARCHAR(255) NOT NULL,
//             price DECIMAL(10, 2) NOT NULL,
//             description TEXT,
//             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
//         );
//       ''';
//       try {
//         conn = await MySqlConnection.connect(dbSettings);
//         print('=====come here====2=====> ${conn.hashCode}// ${conn.runtimeType}');
//
//         await conn.query(createTableSQL);
//
//         // Prepare an INSERT statement with placeholders for safety (prevents SQL injection)
//         // var result = await conn.query(
//         //   'INSERT INTO products (name, email) VALUES (?, ?)',
//         //   [name, email],
//         // );
//
//         // var result = await conn.query(
//         //   'INSERT INTO products (name, price, description) VALUES (?, ?, ?)',
//         //   [name, email, email],
//         // );
//         print('=====come here====3=====');
//         // Get the ID of the newly inserted row
//         // final newId = result.insertId;
//         print('=====come here====4=====');
//         return Response.ok(
//           jsonEncode({'message': 'User inserted successfully', 'id': 'y'}),
//           headers: {'Content-Type': 'application/json'},
//         );
//       } on MySqlException catch (e) {
//         if (e.message.contains('Duplicate entry') && e.message.contains('for key \'email\'')) {
//           return Response(
//             HttpStatus.conflict, // 409 Conflict
//             body: jsonEncode({'error': 'Email already exists'}),
//             headers: {'Content-Type': 'application/json'},
//           );
//         }
//         print('MySQL Error: $e');
//         return Response.internalServerError(
//           body: jsonEncode({'error': 'Database error: ${e.message}'}),
//           headers: {'Content-Type': 'application/json'},
//         );
//       } finally {
//         print('======== close connection ========');
//         await conn?.close(); // Ensure connection is closed
//       }
//     } catch (e) {
//       print('Server Error: $e');
//       return Response.internalServerError(
//         body: jsonEncode({'error': 'An unexpected error occurred'}),
//         headers: {'Content-Type': 'application/json'},
//       );
//     }
//   });
//
//   // Example GET endpoint to fetch users (for verification)
//   _router.get('/users', (Request request) async {
//     MySqlConnection? conn;
//     try {
//       conn = await MySqlConnection.connect(dbSettings);
//       print('Connected to database successfully.: ${conn.hashCode}');
//       var results = await conn.query('SELECT id, name, email, created_at FROM names');
//       print('Fetched ${results.length} users from the database.');
//
//       List<Map<String, dynamic>> users = [];
//       for (var row in results) {
//         users.add({
//           'id': row[0],
//           'name': row[1],
//           'email': row[2],
//           'created_at': row[3].toString(), // Convert DateTime to String
//         });
//       }
//
//       return Response.ok(
//         jsonEncode(users),
//         headers: {'Content-Type': 'application/json'},
//       );
//     } catch (e) {
//       print('Error fetching users: $e');
//       return Response.internalServerError(body: 'Could not fetch users');
//     } finally {
//       await conn?.close();
//     }
//   });
//
//   // For running in containers, we respect the PORT environment variable.
//   final port = int.parse(Platform.environment['PORT'] ?? '8080');
//   final server = await serve(handler, ip, port);
//   print('Server listening on port ${server.port}');



}
