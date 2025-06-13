import 'package:my_shelf_mysql_app/middleware/auth_middleware.dart';
import 'package:my_shelf_mysql_app/routes/auth_routes.dart';
import 'package:my_shelf_mysql_app/routes/user_routes.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../routes/profile_route.dart';

/// Creates and configures the main application router.
Router createRouter() {
  final router = Router();
  final protectedRouter = Router(); // Routes that require authentication

  // // Mount your API routes
  // router.mount('/api/v1/', getUsersRouter().call);
  // router.mount('/api/v1/', getPostsRouter().call);
  //
  // Mount your user routes and post routes
  router.mount('/api/v1/', getUserRouter().call);
  router.mount('/api/v1/auth', getAuthRouter().call);
  // router.mount('/api/v1/', getProfileRouter().call);
  // router.mount('/api', getPostRouter().call); // Mount the post router

  router.mount(
      '/api/v1/profile',
      // THIS IS WHERE authenticateUser IS APPLIED
      Pipeline()
          .addMiddleware(authenticateUser()) // Apply the authentication middleware
          .addHandler(getProfileRouter().call)); // Then add the handler for profile routes

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