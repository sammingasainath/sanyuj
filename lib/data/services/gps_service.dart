import 'package:geolocator/geolocator.dart';
import 'package:sensor_api/domain/entities/gps_data.dart';
import 'package:logging/logging.dart';

/// Service for accessing GPS location data
class GpsService {
  final _logger = Logger('GpsService');
  bool _permissionRequested = false;

  /// Checks if location services are enabled and requests permission if needed
  Future<bool> _checkPermission() async {
    if (_permissionRequested) return true;

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _logger.warning('Location services are disabled.');
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _logger.warning('Location permissions are denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _logger.warning('Location permissions are permanently denied');
      return false;
    }

    _permissionRequested = true;
    return true;
  }

  /// Gets the current GPS location
  Future<GpsData?> getCurrentLocation() async {
    try {
      final hasPermission = await _checkPermission();
      if (!hasPermission) {
        return null;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return GpsData(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
        altitude: position.altitude,
        speed: position.speed,
        heading: position.heading,
        timestamp: position.timestamp ?? DateTime.now(),
      );
    } catch (e) {
      _logger.severe('Error getting GPS location: $e');
      return null;
    }
  }

  /// Creates a stream of GPS location updates
  Stream<GpsData> getLocationStream() async* {
    try {
      final hasPermission = await _checkPermission();
      if (!hasPermission) {
        yield* Stream.empty();
        return;
      }

      yield* Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      ).map(
        (position) => GpsData(
          latitude: position.latitude,
          longitude: position.longitude,
          accuracy: position.accuracy,
          altitude: position.altitude,
          speed: position.speed,
          heading: position.heading,
          timestamp: position.timestamp ?? DateTime.now(),
        ),
      );
    } catch (e) {
      _logger.severe('Error in GPS location stream: $e');
      yield* Stream.empty();
    }
  }
}
