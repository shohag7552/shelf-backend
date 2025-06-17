// lib/routes/upload_route.dart
import 'dart:convert';
import 'dart:io'; // Required for File and Directory operations
import 'dart:math'; // For min function in debug print

import 'package:my_shelf_mysql_app/helper/project_helper.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
// Import the main shelf_multipart library, not form_data.dart directly
import 'package:shelf_multipart/shelf_multipart.dart'; // <--- IMPORTANT: Updated Import!
import 'package:path/path.dart' as p;        // For platform-agnostic path manipulation
import 'package:uuid/uuid.dart';             // For generating unique filenames

Router getUploadRouter() {
  final router = Router();
  final Uuid uuid = Uuid(); // Instantiate Uuid for unique ID generation

  // POST /upload - Handles file uploads
  router.post('/upload', (Request request) async {
    print('--> [UploadRoute] Received upload request. Content-Type: ${request.headers[HttpHeaders.contentTypeHeader]}');

    try {
      String? uploadedFileUrl; // This will store the relative URL of the saved file

      if (request.multipart() case var multipart?) {
        // Iterate over parts making up this request:
        final description = StringBuffer('Regular multipart request\n');
        await for (final part in multipart.parts) {
          print('--> [UploadRoute] Processing part: Name=${part.headers}// ${part.headers['filename']}');

          // Headers are available through part.headers as a map:
          // final headers = part.headers;

          // part implements the `Stream<List<int>>` interface which can be used to
          // read data. You can also use `part.readBytes()` or `part.readString()`

          Map<String, String> data = {};
          part.headers.forEach((key, value) {
            data.addAll({key : value});
          });

          ///Convert data properly for getting required values [originalFilename] [contentType]
          data = ProjectHelper.convertStringToMap(data.toString());

          final originalFilename = data['filename'];
          final contentType = data['content-type'];

          print('=====> $originalFilename // $contentType // ${part.headers}');
          //
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
              return Response.internalServerError(body: jsonEncode({'error': 'Server storage error'}));
            }
          }

          // Write the file bytes to the disk
          await file.writeAsBytes(bytes);
          print('--> [UploadRoute] File saved successfully to: ${file.path}');

          // Construct the URL path
          uploadedFileUrl = '/$uploadDirectory/$uniqueFileName';
          print('--> [UploadRoute] Generated file URL for client/DB: $uploadedFileUrl');

          // Assuming only one file upload per request for simplicity
          break; // Stop afte
        }
      } else {
        return Response(401); // not a multipart request
      }

      // 4. Return the result to the client
      if (uploadedFileUrl != null) {
        return Response.ok(
          jsonEncode({
            'message': 'File uploaded successfully',
            'fileUrl': uploadedFileUrl,
          }),
          headers: {'Content-Type': 'application/json'},
        );
      } else {
        print('--- [UploadRoute] Error: No file part found in the request after processing. ---');
        return Response.badRequest(body: jsonEncode({'error': 'No file found in the request'}));
      }
    } catch (e, stackTrace) {
      // 5. Comprehensive error handling
      print('--- [UploadRoute] CRITICAL ERROR during file upload: $e ---');
      print('--- [UploadRoute] Stack trace: $stackTrace ---');
      return Response.internalServerError(body: jsonEncode({'error': 'Failed to upload file due to server error'}));
    }
  });

  return router;
}