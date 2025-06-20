import 'dart:convert';
import 'dart:io';

import 'package:mime/mime.dart';
import 'package:shelf/shelf.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

class ProjectHelper {

  static Future<(Map<String, dynamic>, String?)> generateDataWithMultipart(Request request) async {
    Map<String, dynamic> data = {};
    String? imageUrl;

    final contentType = request.headers[HttpHeaders.contentTypeHeader];

    if (contentType != null && contentType.contains('application/json')) {
      // Handle JSON request
      print('==== [json]');
      final String body = await request.readAsString();
      data = jsonDecode(body) as Map<String, dynamic>;

    } else if (contentType != null && contentType.contains('multipart/form-data')) {
      // Handle multipart form data
      print('==== [form-data]');
      final boundary = contentType.split("boundary=").last;
      final transformer = MimeMultipartTransformer(boundary);
      final parts = transformer.bind(request.read());

      final Map<String, String> formFields = {};
      File? imageFile;

      await for (final part in parts) {
        final headers = part.headers;
        final contentDisposition = headers['content-disposition'];
        if (contentDisposition == null) continue;

        final nameMatch = RegExp(r'name="([^"]+)"').firstMatch(contentDisposition);
        final filenameMatch = RegExp(r'filename="([^"]+)"').firstMatch(contentDisposition);

        final name = nameMatch?.group(1);
        final filename = filenameMatch?.group(1);

        final d = await part.fold<List<int>>([], (p, e) => p..addAll(e));

        if (filename == null && name != null) {
          data[name] = utf8.decode(d);
          // formFields[name] = utf8.decode(data);
        } else if (name == 'image' && filename != null) {
          final uploadsDir = Directory('uploads');
          if (!uploadsDir.existsSync()) uploadsDir.createSync();

          final safeName = '${Uuid().v4()}_${filename.replaceAll(RegExp(r'[^a-zA-Z0-9_.-]'), '_')}';
          final imagePath = p.join(uploadsDir.path, safeName);
          final file = File(imagePath);
          await file.writeAsBytes(d);
          imageFile = file;
        }
      }
      imageUrl = imageFile?.path;
    } else {
      // return Response.badRequest(body: jsonEncode({
      //   'error': 'Unsupported Content-Type. Use application/json or multipart/form-data.'
      // }));
    }
    return (data, imageUrl);
  }

  static Map<String, String> convertStringToMap(String data) {
    // Step 1: Remove the outer curly braces and split by ','
    String cleanedString = data.trim();
    if (cleanedString.startsWith('{') && cleanedString.endsWith('}')) {
      cleanedString = cleanedString.substring(1, cleanedString.length - 1).trim();
    }

    // Split by ', ' to separate the main components
    List<String> parts = cleanedString.split(', ').map((s) => s.trim()).toList();

    Map<String, String> parsedMap = {};

    // Process each part
    for (String part in parts) {
      // For 'content-disposition' which has multiple key-value pairs
      if (part.startsWith('content-disposition:')) {
        List<String> dispositionParts = part.substring('content-disposition:'.length).trim().split(';');
        parsedMap['content-disposition'] = dispositionParts[0].trim(); // 'form-data'

        for (int i = 1; i < dispositionParts.length; i++) {
          String subPart = dispositionParts[i].trim();
          if (subPart.contains('=')) {
            List<String> keyValue = subPart.split('=');
            String key = keyValue[0].trim();
            String value = keyValue[1].trim().replaceAll('"', ''); // Remove quotes from value
            parsedMap[key] = value;
          }
        }
      }
      // For other simple key-value pairs like 'content-type'
      else if (part.contains(':')) {
        int colonIndex = part.indexOf(':');
        String key = part.substring(0, colonIndex).trim();
        String value = part.substring(colonIndex + 1).trim();
        parsedMap[key] = value;
      }
    }

    print('Original String: $data');
    print('Parsed Map: $parsedMap');

    return parsedMap;
  }
}