import 'package:shelf/shelf.dart';
import 'package:my_shelf_mysql_app/src/generated_prisma_client/client.dart';

Middleware corsHeaders() {
  return (innerHandler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response.ok(
          null,
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept, Authorization',
          },
        );
      }
      final response = await innerHandler(request);
      return response.change(headers: {
        'Access-Control-Allow-Origin': '*',
      });
    };
  };
}