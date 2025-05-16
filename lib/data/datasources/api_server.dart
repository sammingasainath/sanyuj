import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/entities/additional_sensors.dart';
import 'package:sensor_api/domain/usecases/get_sensor_data.dart';
import 'package:sensor_api/data/services/flashlight_service.dart';
import 'package:sensor_api/data/services/api_docs_service.dart';

class ApiServer {
  final GetAccelerometerDataUseCase getAccelerometerData;
  final GetGyroscopeDataUseCase getGyroscopeData;
  final GetMagnetometerDataUseCase getMagnetometerData;
  final GetProximityDataUseCase getProximityData;
  final GetLightDataUseCase getLightData;
  final GetPressureDataUseCase getPressureData;
  final GetCombinedSensorDataUseCase getCombinedSensorData;
  final GetAvailableSensorsUseCase getAvailableSensors;

  // Additional sensor use cases
  final GetStepCounterDataUseCase? getStepCounterData;
  final GetStepDetectorDataUseCase? getStepDetectorData;
  final GetRotationVectorDataUseCase? getRotationVectorData;
  final GetOrientationDataUseCase? getOrientationData;
  final GetGravityDataUseCase? getGravityData;
  final GetLinearAccelerationDataUseCase? getLinearAccelerationData;
  final GetGameRotationVectorDataUseCase? getGameRotationVectorData;
  final GetGeomagneticRotationVectorDataUseCase?
  getGeomagneticRotationVectorData;

  // New sensor use cases
  final GetSignificantMotionDataUseCase? getSignificantMotionData;
  final GetStationaryDetectDataUseCase? getStationaryDetectData;
  final GetWakeGestureDataUseCase? getWakeGestureData;
  final GetPickupDetectDataUseCase? getPickupDetectData;
  final GetAccelerometerUncalibratedDataUseCase?
  getAccelerometerUncalibratedData;
  final GetMagneticFieldUncalibratedDataUseCase?
  getMagneticFieldUncalibratedData;
  final GetGyroscopeUncalibratedDataUseCase? getGyroscopeUncalibratedData;

  // Flashlight service
  final FlashlightService _flashlightService = FlashlightService();

  // API documentation service
  final ApiDocsService _apiDocsService = ApiDocsService();

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
    this.getStepCounterData,
    this.getStepDetectorData,
    this.getRotationVectorData,
    this.getOrientationData,
    this.getGravityData,
    this.getLinearAccelerationData,
    this.getGameRotationVectorData,
    this.getGeomagneticRotationVectorData,
    // New sensor parameters
    this.getSignificantMotionData,
    this.getStationaryDetectData,
    this.getWakeGestureData,
    this.getPickupDetectData,
    this.getAccelerometerUncalibratedData,
    this.getMagneticFieldUncalibratedData,
    this.getGyroscopeUncalibratedData,
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
    print('API documentation available at http://$_host:$_port/docs');
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
        // Don't override Content-Type if it's already set (for HTML responses)
        final headers = {
          ...response.headers,
          'Access-Control-Allow-Origin': '*',
        };

        // Only set JSON Content-Type for responses that don't already have a Content-Type
        if (!response.headers.containsKey('Content-Type')) {
          headers['Content-Type'] = 'application/json';
        }

        return response.change(headers: headers);
      },
    );
  }

  Handler _router() {
    return (request) async {
      final path = request.url.path;

      // Serve API documentation at /docs endpoint
      if (path == 'docs' || path.startsWith('docs/')) {
        return _apiDocsService.getDocsHandler()(request);
      }

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
        } else if (path == 'stepcounter') {
          if (getStepCounterData != null) {
            final data = await getStepCounterData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Step counter sensor not supported',
              null,
            );
          }
        } else if (path == 'stepdetector') {
          if (getStepDetectorData != null) {
            final data = await getStepDetectorData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Step detector sensor not supported',
              null,
            );
          }
        } else if (path == 'rotationvector') {
          if (getRotationVectorData != null) {
            final data = await getRotationVectorData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Rotation vector sensor not supported',
              null,
            );
          }
        } else if (path == 'orientation') {
          if (getOrientationData != null) {
            final data = await getOrientationData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Orientation sensor not supported',
              null,
            );
          }
        } else if (path == 'gravity') {
          if (getGravityData != null) {
            final data = await getGravityData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(false, 'Gravity sensor not supported', null);
          }
        } else if (path == 'linearacceleration') {
          if (getLinearAccelerationData != null) {
            final data = await getLinearAccelerationData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Linear acceleration sensor not supported',
              null,
            );
          }
        } else if (path == 'gamerotationvector') {
          if (getGameRotationVectorData != null) {
            final data = await getGameRotationVectorData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Game rotation vector sensor not supported',
              null,
            );
          }
        } else if (path == 'geomagneticrotationvector') {
          if (getGeomagneticRotationVectorData != null) {
            final data = await getGeomagneticRotationVectorData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Geomagnetic rotation vector sensor not supported',
              null,
            );
          }
        } else if (path == 'significantmotion') {
          if (getSignificantMotionData != null) {
            final data = await getSignificantMotionData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Significant motion sensor not supported',
              null,
            );
          }
        } else if (path == 'stationarydetect') {
          if (getStationaryDetectData != null) {
            final data = await getStationaryDetectData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Stationary detect sensor not supported',
              null,
            );
          }
        } else if (path == 'wakegesture') {
          if (getWakeGestureData != null) {
            final data = await getWakeGestureData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Wake gesture sensor not supported',
              null,
            );
          }
        } else if (path == 'pickupdetect') {
          if (getPickupDetectData != null) {
            final data = await getPickupDetectData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Pickup detect sensor not supported',
              null,
            );
          }
        } else if (path == 'accelerometeruncalibrated') {
          if (getAccelerometerUncalibratedData != null) {
            final data = await getAccelerometerUncalibratedData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Accelerometer uncalibrated sensor not supported',
              null,
            );
          }
        } else if (path == 'magneticfielduncalibrated') {
          if (getMagneticFieldUncalibratedData != null) {
            final data = await getMagneticFieldUncalibratedData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Magnetic field uncalibrated sensor not supported',
              null,
            );
          }
        } else if (path == 'gyroscopeuncalibrated') {
          if (getGyroscopeUncalibratedData != null) {
            final data = await getGyroscopeUncalibratedData!();
            return _jsonResponse(true, 'Success', data?.toJson());
          } else {
            return _jsonResponse(
              false,
              'Gyroscope uncalibrated sensor not supported',
              null,
            );
          }
        } else if (path == 'all') {
          final data = await getCombinedSensorData();
          return _jsonResponse(true, 'Success', data.toJson());
        } else if (path == 'flashlight') {
          final result = await _flashlightService.toggleFlashlight();
          return _jsonResponse(true, 'Success', {'result': result});
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
