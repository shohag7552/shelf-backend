import 'dart:convert';
import 'dart:io';

import 'package:mime/mime.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_multipart/shelf_multipart.dart';
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

  static Future<String?> uploadImage(Request request) async {
    String? uploadedFileUrl;

    if (request.multipart() case var multipart?) {
      await for (final part in multipart.parts) {
        print('--> [UploadRoute] Processing part: Name=${part.headers}');

        Map<String, String> data = {};
        part.headers.forEach((key, value) {
          data.addAll({key : value});
        });

        ///Convert data properly for getting required values [originalFilename] [contentType]
        data = ProjectHelper.convertStringToMap(data.toString());

        final originalFilename = data['filename'];
        final contentType = data['content-type'];

        print('=====> [UploadRoute] content data $originalFilename // $contentType // ${part.headers}');

        if (originalFilename == null) {
          print('--- [UploadRoute] Warning: FilePart received without a filename. Skipping. ---');
          continue; // Skip parts that are treated as files but have no filename
        }

        // Optional: Basic validation for image types
        if (contentType != null && !contentType.startsWith('image/')) {
          print('--- [UploadRoute] Warning: Uploaded file is not an image ($contentType). Skipping. ---');
          continue;
        }

        // Read the binary content of the file
        final bytes = await part.readBytes(); // Use part.readBytes() directly
        print('--> [UploadRoute] File $originalFilename has ${bytes.length} bytes.');

        // // Determine the file extension safely
        final fileExtension = p.extension(originalFilename);
        if (fileExtension.isEmpty) {
          print('--- [UploadRoute] Warning: File has no extension. Using .bin as fallback. ---');
        }
        final Uuid uuid = Uuid(); // I

        // Generate a unique filename
        final uniqueFileName = '${uuid.v4()}${fileExtension.isNotEmpty ? fileExtension.toLowerCase() : '.bin'}';
        const String uploadDirectory = 'uploads';
        final filePath = p.join(Directory.current.path, uploadDirectory, uniqueFileName);
        print('--> [UploadRoute] Attempting to save file to: $filePath');

        final file = File(filePath);

        // Ensure the target directory exists
        final directory = Directory(p.dirname(filePath));
        if (!await directory.exists()) {
          try {
            await directory.create(recursive: true);
            print('--> [UploadRoute] Created directory: ${directory.path}');
          } catch (e) {
            print('--- [UploadRoute] CRITICAL ERROR: Could not create upload directory: $e ---');
            return null;
          }
        }

        // Write the file bytes to the disk
        await file.writeAsBytes(bytes);
        print('--> [UploadRoute] File saved successfully to: ${file.path}');

        // Construct the URL path
        uploadedFileUrl = '/$uploadDirectory/$uniqueFileName';
        print('--> [UploadRoute] Generated file URL for client/DB: $uploadedFileUrl');

        return uploadedFileUrl;
      }
    } else {
      return null;
    }
    return null;

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