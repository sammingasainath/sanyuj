import 'dart:io';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_swagger_ui/shelf_swagger_ui.dart';

/// Service for serving Swagger UI documentation for the API
class SwaggerService {
  static const String _swaggerYamlPath = 'lib/data/swagger/swagger_doc.yaml';

  /// Get a handler for serving Swagger UI documentation
  Handler getSwaggerHandler() {
    return (Request request) async {
      final path = request.url.path;

      // If the request is for the specification file, serve it directly
      if (path == 'swagger_doc.yaml') {
        final file = File(_swaggerYamlPath);
        if (file.existsSync()) {
          return Response.ok(
            file.readAsBytesSync(),
            headers: {
              'Content-Type': 'application/yaml',
              'Access-Control-Allow-Origin': '*',
            },
          );
        } else {
          return Response.notFound('Swagger specification file not found');
        }
      }

      // For the UI, we need to modify the HTML to use an absolute URL
      if (path == 'docs' || path == '') {
        // Read the Swagger UI HTML template
        final handler = SwaggerUI(
          _swaggerYamlPath,
          title: 'Sensor API Documentation',
        );
        final response = await handler(request);

        if (response.statusCode == 200) {
          // Get the base URL from the request
          final scheme = request.requestedUri.scheme;
          final host = request.requestedUri.host;
          final port = request.requestedUri.port;
          final baseUrl = '$scheme://$host:$port';

          // Get the response body as string
          final bodyBytes = await response.read().toList();
          final bodyString = utf8.decode(bodyBytes.expand((x) => x).toList());

          // Modify the HTML to use an absolute URL for the swagger_doc.yaml
          final modifiedHtml = bodyString.replaceAll(
            'url: "swagger_doc.yaml"',
            'url: "$baseUrl/swagger_doc.yaml"',
          );

          return Response.ok(
            modifiedHtml,
            headers: {'Content-Type': 'text/html; charset=utf-8'},
          );
        }
        return response;
      }

      // For any other paths under /docs
      return SwaggerUI(_swaggerYamlPath, title: 'Sensor API Documentation')(
        request,
      );
    };
  }
}
