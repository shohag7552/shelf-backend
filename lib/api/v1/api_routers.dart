import 'package:my_shelf_mysql_app/routes/user_routes.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

/// Creates and configures the main application router.
Router createRouter() {
  final router = Router();

  // // Mount your API routes
  // router.mount('/api/v1/', getUsersRouter().call);
  // router.mount('/api/v1/', getPostsRouter().call);
  //
  // Mount your user routes and post routes
  router.mount('/api/v1/', getUserRouter().call);
  // router.mount('/api', getPostRouter().call); // Mount the post router

  // Add a simple root handler
  router.get('/', (Request request) {
    return Response.ok('Hello, Shelf with MySQL and ORM!');
  });

  // Health check endpoint
  router.get('/health', (Request request) => Response.ok('OK'));

  // Fallback for unmatched routes
  router.all('/<ignored|.*>', (Request request) => Response.notFound('Not Found'));

  return router;
}