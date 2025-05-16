# Sensor API

A Flutter project for accessing and exposing device sensors through a REST API server.

## Endpoints

The API server exposes the following endpoints:

### Sensor Endpoints

- `/sensors` - Get a list of available sensors
- `/accelerometer` - Get accelerometer data
- `/gyroscope` - Get gyroscope data
- `/magnetometer` - Get magnetometer data
- `/proximity` - Get proximity sensor data
- `/light` - Get light sensor data
- `/pressure` - Get pressure sensor data
- `/all` - Get combined data from all sensors

### Additional Sensor Endpoints

- `/stepcounter` - Get step counter data
- `/stepdetector` - Get step detector data
- `/rotationvector` - Get rotation vector data
- `/orientation` - Get orientation data
- `/gravity` - Get gravity data
- `/linearacceleration` - Get linear acceleration data
- `/gamerotationvector` - Get game rotation vector data
- `/geomagneticrotationvector` - Get geomagnetic rotation vector data

### Uncalibrated Sensor Endpoints

- `/accelerometeruncalibrated` - Get uncalibrated accelerometer data
- `/magneticfielduncalibrated` - Get uncalibrated magnetic field data
- `/gyroscopeuncalibrated` - Get uncalibrated gyroscope data

### Device Control Endpoints

- `/flashlight` - Toggle the device's flashlight (returns the new flashlight state)

### Documentation

- `/docs` - Interactive Swagger documentation for all API endpoints

## Usage

The API server runs on port 8080 by default. To access sensor data, make HTTP GET requests to the endpoint URLs.

Example:
```
GET http://[device-ip]:8080/accelerometer
```

Response format:
```json
{
  "success": true,
  "message": "Success",
  "data": {
    "x": 0.123,
    "y": 0.456,
    "z": 9.789,
    "timestamp": "2023-05-16T08:51:05.687095",
    "tenantId": "default"
  }
}
```

## API Documentation

Visit the interactive Swagger documentation at `/docs` endpoint for:
- Complete API reference
- Request/response schemas
- Try-it-out functionality for testing endpoints directly from your browser

Example:
```
http://[device-ip]:8080/docs
```

## Building and Running

Make sure you have Flutter installed. Then run:

```
flutter pub get
flutter run
```

The app will start the API server automatically.
