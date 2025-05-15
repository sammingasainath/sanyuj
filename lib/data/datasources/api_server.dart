import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/usecases/get_sensor_data.dart';

class ApiServer {
  final GetAccelerometerDataUseCase getAccelerometerData;
  final GetGyroscopeDataUseCase getGyroscopeData;
  final GetMagnetometerDataUseCase getMagnetometerData;
  final GetProximityDataUseCase getProximityData;
  final GetLightDataUseCase getLightData;
  final GetPressureDataUseCase getPressureData;
  final GetCombinedSensorDataUseCase getCombinedSensorData;
  final GetAvailableSensorsUseCase getAvailableSensors;

  HttpServer? _server;
  String _host = '0.0.0.0';
  int _port = 8080;

  ApiServer({
    required this.getAccelerometerData,
    required this.getGyroscopeData,
    required this.getMagnetometerData,
    required this.getProximityData,
    required this.getLightData,
    required this.getPressureData,
    required this.getCombinedSensorData,
    required this.getAvailableSensors,
  });

  Future<void> start({String? host, int? port}) async {
    _host = host ?? _host;
    _port = port ?? _port;

    final handler = Pipeline()
        .addMiddleware(logRequests())
        .addMiddleware(_corsMiddleware())
        .addHandler(_router());

    _server = await shelf_io.serve(handler, _host, _port);
    print('Server running on http://$_host:$_port');
  }

  Future<void> stop() async {
    await _server?.close();
    _server = null;
    print('Server stopped');
  }

  Middleware _corsMiddleware() {
    return createMiddleware(
      requestHandler: (request) {
        if (request.method == 'OPTIONS') {
          return Response.ok(
            '',
            headers: {
              'Access-Control-Allow-Origin': '*',
              'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
              'Access-Control-Allow-Headers': 'Origin, Content-Type',
            },
          );
        }
        return null;
      },
      responseHandler: (response) {
        return response.change(
          headers: {
            ...response.headers,
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json',
          },
        );
      },
    );
  }

  Handler _router() {
    return (request) async {
      final path = request.url.path;

      try {
        if (path == 'sensors') {
          final sensors = await getAvailableSensors();
          return _jsonResponse(true, 'Success', sensors);
        } else if (path == 'accelerometer') {
          final data = await getAccelerometerData();
          return _jsonResponse(true, 'Success', data.toJson());
        } else if (path == 'gyroscope') {
          final data = await getGyroscopeData();
          return _jsonResponse(true, 'Success', data.toJson());
        } else if (path == 'magnetometer') {
          final data = await getMagnetometerData();
          return _jsonResponse(true, 'Success', data.toJson());
        } else if (path == 'proximity') {
          final data = await getProximityData();
          return _jsonResponse(true, 'Success', data?.toJson());
        } else if (path == 'light') {
          final data = await getLightData();
          return _jsonResponse(true, 'Success', data?.toJson());
        } else if (path == 'pressure') {
          final data = await getPressureData();
          return _jsonResponse(true, 'Success', data?.toJson());
        } else if (path == 'all') {
          final data = await getCombinedSensorData();
          return _jsonResponse(true, 'Success', data.toJson());
        } else {
          return _jsonResponse(false, 'Endpoint not found', null);
        }
      } catch (e) {
        return _jsonResponse(false, 'Error: ${e.toString()}', null);
      }
    };
  }

  Response _jsonResponse(bool success, String message, dynamic data) {
    final Map<String, dynamic> responseMap = {
      'success': success,
      'message': message,
      'data': data,
    };

    final statusCode = success ? 200 : (data == null ? 404 : 500);

    return Response(
      statusCode,
      body: jsonEncode(responseMap),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
