// lib/routes/upload_route.dart
import 'dart:convert';
import 'dart:io'; // Required for File and Directory operations
import 'dart:math'; // For min function in debug print

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

    // 1. Validate if the request is multipart
    // The `isMultipart` getter is still available and crucial.
    // if (!request.isMultipart) {
    //   print('--- [UploadRoute] Error: Request is not multipart. ---');
    //   return Response.badRequest(body: jsonEncode({'error': 'Request must be multipart/form-data'}));
    // }



    try {
      String? uploadedFileUrl; // This will store the relative URL of the saved file
      //
      // /*if (request.formData() case var form?) {
      //   final description = StringBuffer('Parsed form multipart request\n');
      //
      //   await for (final formData in form.formData) {
      //     description
      //         .writeln('${formData.name}: ${await formData.part.readString()}');
      //   }
      //
      //   return Response.ok(description.toString());
      // } else*/ if (request.multipart() case var multipart?) {
      //   final description = StringBuffer('Regular multipart request\n');
      //
      //   await for (final part in multipart.parts) {
      //     description.writeln('new part');
      //
      //     part.headers
      //         .forEach((key, value) => description.writeln('Header $key=$value'));
      //     final content = await part.readString();
      //     description.writeln('content: $content');
      //
      //     description.writeln('end of part');
      //     print('=====sss===> ${description}');
      //   }
      //
      //   return Response.ok(description.toString());
      // } else {
      //   return Response.ok('Not a multipart request');
      // }

      if (request.multipart() case var multipart?) {
        // Iterate over parts making up this request:
        final description = StringBuffer('Regular multipart request\n');
        await for (final part in multipart.parts) {
          print('--> [UploadRoute] Processing part: Name=${part.headers}// ${part.headers['filename']}');

          // Headers are available through part.headers as a map:
          final headers = part.headers;

          // part implements the `Stream<List<int>>` interface which can be used to
          // read data. You can also use `part.readBytes()` or `part.readString()`

          Map<String, String> data = {};
          part.headers.forEach((key, value) {
            data.addAll({key : value});
                // print('Header $key=$value');
          });

          data = data.toString().replaceAll(';', ',').replaceAll('=', ':') as Map<String, String>;
          // final content = await part.readBytes();
          print('======data is: ${data}');
          // description.writeln('content: $content');
          //
          // description.writeln('end of part');
          // // print('=====sss===> ${description}');
          //
          final originalFilename = headers['name'];
          final contentType = headers['content-type'];

          print('=====> $originalFilename // $contentType // ${part.headers}');
          //
          // if (originalFilename == null) {
          //   print('--- [UploadRoute] Warning: FilePart received without a filename. Skipping. ---');
          //   continue; // Skip parts that are treated as files but have no filename
          // }
          //
          // // Optional: Basic validation for image types
          // if (contentType != null && !contentType.startsWith('image/')) {
          //   print('--- [UploadRoute] Warning: Uploaded file is not an image ($contentType). Skipping. ---');
          //   continue;
          // }

          // Read the binary content of the file
          final bytes = await part.readBytes(); // Use part.readBytes() directly
          print('--> [UploadRoute] File  has ${bytes.length} bytes.');

          // // Determine the file extension safely
          // final fileExtension = p.extension(originalFilename);
          // if (fileExtension.isEmpty) {
          //   print('--- [UploadRoute] Warning: File has no extension. Using .bin as fallback. ---');
          // }
          //
          // // Generate a unique filename
          // final uniqueFileName = '${uuid.v4()}${fileExtension.isNotEmpty ? fileExtension.toLowerCase() : '.bin'}';
          // const String uploadDirectory = 'uploads';
          // final filePath = p.join(Directory.current.path, uploadDirectory, uniqueFileName);
          // print('--> [UploadRoute] Attempting to save file to: $filePath');

        }
      } else {
        return Response(401); // not a multipart request
      }

      // 2. Iterate directly over request.parts to get each multipart part.
      // request.parts is a Stream<Part>, so we can use await for.
      /*await for (final part in multipart.parts) {
        print('--> [UploadRoute] Processing part: Name=${part.name}, Filename=${part.filename}, ContentType=${part.contentType}');

        // 3. Distinguish between FilePart and FieldPart
        if (part is FilePart) { // This is a file part
          final originalFilename = part.filename;
          final contentType = part.contentType;

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
          print('--> [UploadRoute] File "${originalFilename}" has ${bytes.length} bytes.');

          // Determine the file extension safely
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
          break; // Stop after the first file part is processed
        } else if (part is FieldPart) { // This is a regular form field (e.g., text, numbers)
          // You can read regular form fields like 'name', 'description' here if needed
          final fieldName = part.name;
          final fieldValue = await part.readString(); // Read field content as string
          print('--> [UploadRoute] Field: $fieldName = "$fieldValue"');
        }
      }*/

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