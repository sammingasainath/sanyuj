import 'package:sensor_api/data/services/gps_service.dart';
import 'package:sensor_api/domain/entities/gps_data.dart';

/// Use case for getting GPS location data
class GetGpsDataUseCase {
  final GpsService _gpsService;

  GetGpsDataUseCase(this._gpsService);

  /// Get the current GPS location
  Future<GpsData?> call() async {
    return await _gpsService.getCurrentLocation();
  }

  /// Get a stream of GPS location updates
  Stream<GpsData> getStream() {
    return _gpsService.getLocationStream();
  }
}
