import 'package:shelf/shelf.dart';

/// Service for serving a simple API documentation page
class ApiDocsService {
  /// Get a handler for serving API documentation
  Handler getDocsHandler() {
    return (Request request) {
      return Response.ok(
        _generateHtml(),
        headers: {'Content-Type': 'text/html; charset=utf-8'},
      );
    };
  }

  /// Generate HTML for API documentation page
  String _generateHtml() {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sensor API Documentation</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      margin: 0;
      padding: 20px;
      color: #333;
      max-width: 1200px;
      margin: 0 auto;
    }
    h1 {
      color: #2c3e50;
      border-bottom: 2px solid #3498db;
      padding-bottom: 10px;
    }
    h2 {
      color: #2c3e50;
      margin-top: 30px;
    }
    .endpoint {
      background-color: #f9f9f9;
      border-left: 4px solid #3498db;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 0 4px 4px 0;
    }
    .method {
      display: inline-block;
      padding: 4px 8px;
      border-radius: 4px;
      background-color: #3498db;
      color: white;
      font-weight: bold;
      margin-right: 10px;
    }
    .path {
      font-family: monospace;
      font-size: 16px;
      font-weight: bold;
    }
    .description {
      margin-top: 8px;
      color: #555;
    }
    .try-btn {
      display: inline-block;
      margin-top: 10px;
      padding: 6px 12px;
      background-color: #27ae60;
      color: white;
      text-decoration: none;
      border-radius: 4px;
      font-weight: bold;
      cursor: pointer;
    }
    .try-btn:hover {
      background-color: #2ecc71;
    }
    .response {
      margin-top: 10px;
      display: none;
      background-color: #f1f1f1;
      padding: 12px;
      border-radius: 4px;
      overflow-x: auto;
    }
    .response-visible {
      display: block;
    }
    pre {
      background-color: #f1f1f1;
      padding: 12px;
      border-radius: 4px;
      overflow-x: auto;
      margin: 0;
    }
    .section {
      margin-bottom: 40px;
    }
    .loading {
      display: inline-block;
      margin-left: 10px;
      color: #555;
    }
    .close-btn {
      float: right;
      cursor: pointer;
      background-color: #e74c3c;
      color: white;
      border: none;
      border-radius: 4px;
      padding: 4px 8px;
      font-size: 12px;
    }
    .response-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 8px;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <h1>Sensor API Documentation</h1>
  
  <p>This API provides access to various smartphone sensors. All endpoints return JSON responses in the following format:</p>
  
  <pre>{
  "success": true|false,
  "message": "Success or error message",
  "data": { /* Response data */ }
}</pre>

  <h2>Main Sensors</h2>
  <div class="section">
    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/sensors</span></div>
      <div class="description">Get a list of all available sensors on the device</div>
      <button class="try-btn" onclick="fetchEndpoint('/sensors', 'sensors-response')">Try it</button>
      <div id="sensors-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('sensors-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/accelerometer</span></div>
      <div class="description">Get accelerometer data (X, Y, Z axes)</div>
      <button class="try-btn" onclick="fetchEndpoint('/accelerometer', 'accelerometer-response')">Try it</button>
      <div id="accelerometer-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('accelerometer-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/gyroscope</span></div>
      <div class="description">Get gyroscope data (X, Y, Z axes rotation)</div>
      <button class="try-btn" onclick="fetchEndpoint('/gyroscope', 'gyroscope-response')">Try it</button>
      <div id="gyroscope-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('gyroscope-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/magnetometer</span></div>
      <div class="description">Get magnetometer data (X, Y, Z axes magnetic field)</div>
      <button class="try-btn" onclick="fetchEndpoint('/magnetometer', 'magnetometer-response')">Try it</button>
      <div id="magnetometer-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('magnetometer-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/proximity</span></div>
      <div class="description">Get proximity sensor data (distance and whether object is near)</div>
      <button class="try-btn" onclick="fetchEndpoint('/proximity', 'proximity-response')">Try it</button>
      <div id="proximity-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('proximity-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/light</span></div>
      <div class="description">Get ambient light sensor data (illuminance in lux)</div>
      <button class="try-btn" onclick="fetchEndpoint('/light', 'light-response')">Try it</button>
      <div id="light-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('light-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/pressure</span></div>
      <div class="description">Get barometric pressure sensor data (hPa or mbar)</div>
      <button class="try-btn" onclick="fetchEndpoint('/pressure', 'pressure-response')">Try it</button>
      <div id="pressure-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('pressure-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>
  </div>

  <h2>Motion Sensors</h2>
  <div class="section">
    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/stepcounter</span></div>
      <div class="description">Get step counter data (steps taken)</div>
      <button class="try-btn" onclick="fetchEndpoint('/stepcounter', 'stepcounter-response')">Try it</button>
      <div id="stepcounter-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('stepcounter-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/stepdetector</span></div>
      <div class="description">Get step detector data (step detected event)</div>
      <button class="try-btn" onclick="fetchEndpoint('/stepdetector', 'stepdetector-response')">Try it</button>
      <div id="stepdetector-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('stepdetector-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/significantmotion</span></div>
      <div class="description">Get significant motion detector data</div>
      <button class="try-btn" onclick="fetchEndpoint('/significantmotion', 'significantmotion-response')">Try it</button>
      <div id="significantmotion-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('significantmotion-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/stationarydetect</span></div>
      <div class="description">Get stationary detection data</div>
      <button class="try-btn" onclick="fetchEndpoint('/stationarydetect', 'stationarydetect-response')">Try it</button>
      <div id="stationarydetect-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('stationarydetect-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>
  </div>

  <h2>Orientation Sensors</h2>
  <div class="section">
    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/rotationvector</span></div>
      <div class="description">Get rotation vector data</div>
      <button class="try-btn" onclick="fetchEndpoint('/rotationvector', 'rotationvector-response')">Try it</button>
      <div id="rotationvector-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('rotationvector-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/orientation</span></div>
      <div class="description">Get orientation data (azimuth, pitch, roll)</div>
      <button class="try-btn" onclick="fetchEndpoint('/orientation', 'orientation-response')">Try it</button>
      <div id="orientation-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('orientation-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/gravity</span></div>
      <div class="description">Get gravity data</div>
      <button class="try-btn" onclick="fetchEndpoint('/gravity', 'gravity-response')">Try it</button>
      <div id="gravity-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('gravity-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/linearacceleration</span></div>
      <div class="description">Get linear acceleration data (without gravity)</div>
      <button class="try-btn" onclick="fetchEndpoint('/linearacceleration', 'linearacceleration-response')">Try it</button>
      <div id="linearacceleration-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('linearacceleration-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/gamerotationvector</span></div>
      <div class="description">Get game rotation vector data</div>
      <button class="try-btn" onclick="fetchEndpoint('/gamerotationvector', 'gamerotationvector-response')">Try it</button>
      <div id="gamerotationvector-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('gamerotationvector-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/geomagneticrotationvector</span></div>
      <div class="description">Get geomagnetic rotation vector data</div>
      <button class="try-btn" onclick="fetchEndpoint('/geomagneticrotationvector', 'geomagneticrotationvector-response')">Try it</button>
      <div id="geomagneticrotationvector-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('geomagneticrotationvector-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>
  </div>

  <h2>Gesture Sensors</h2>
  <div class="section">
    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/wakegesture</span></div>
      <div class="description">Get wake gesture detection data</div>
      <button class="try-btn" onclick="fetchEndpoint('/wakegesture', 'wakegesture-response')">Try it</button>
      <div id="wakegesture-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('wakegesture-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/pickupdetect</span></div>
      <div class="description">Get pickup detection data</div>
      <button class="try-btn" onclick="fetchEndpoint('/pickupdetect', 'pickupdetect-response')">Try it</button>
      <div id="pickupdetect-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('pickupdetect-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>
  </div>

  <h2>Uncalibrated Sensors</h2>
  <div class="section">
    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/accelerometeruncalibrated</span></div>
      <div class="description">Get uncalibrated accelerometer data</div>
      <button class="try-btn" onclick="fetchEndpoint('/accelerometeruncalibrated', 'accelerometeruncalibrated-response')">Try it</button>
      <div id="accelerometeruncalibrated-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('accelerometeruncalibrated-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/magneticfielduncalibrated</span></div>
      <div class="description">Get uncalibrated magnetic field data</div>
      <button class="try-btn" onclick="fetchEndpoint('/magneticfielduncalibrated', 'magneticfielduncalibrated-response')">Try it</button>
      <div id="magneticfielduncalibrated-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('magneticfielduncalibrated-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/gyroscopeuncalibrated</span></div>
      <div class="description">Get uncalibrated gyroscope data</div>
      <button class="try-btn" onclick="fetchEndpoint('/gyroscopeuncalibrated', 'gyroscopeuncalibrated-response')">Try it</button>
      <div id="gyroscopeuncalibrated-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('gyroscopeuncalibrated-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>
  </div>

  <h2>Advanced Sensors</h2>
  <div class="section">
    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/gps</span></div>
      <div class="description">Get GPS location data (latitude, longitude, accuracy, etc.)</div>
      <button class="try-btn" onclick="fetchEndpoint('/gps', 'gps-response')">Try it</button>
      <div id="gps-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('gps-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/camera</span></div>
      <div class="description">Take a photo using the current camera and return image data</div>
      <button class="try-btn" onclick="fetchEndpoint('/camera', 'camera-response')">Try it</button>
      <div id="camera-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('camera-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/camera/front</span></div>
      <div class="description">Take a photo using the front camera and return image data</div>
      <button class="try-btn" onclick="fetchEndpoint('/camera/front', 'camera-front-response')">Try it</button>
      <div id="camera-front-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('camera-front-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/camera/back</span></div>
      <div class="description">Take a photo using the back camera and return image data</div>
      <button class="try-btn" onclick="fetchEndpoint('/camera/back', 'camera-back-response')">Try it</button>
      <div id="camera-back-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('camera-back-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>

    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/flashlight</span></div>
      <div class="description">Toggle the device flashlight</div>
      <button class="try-btn" onclick="fetchEndpoint('/flashlight', 'flashlight-response')">Try it</button>
      <div id="flashlight-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('flashlight-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>
  </div>

  <h2>Aggregate Data</h2>
  <div class="section">
    <div class="endpoint">
      <div><span class="method">GET</span> <span class="path">/all</span></div>
      <div class="description">Get data from all available sensors in a single response</div>
      <button class="try-btn" onclick="fetchEndpoint('/all', 'all-response')">Try it</button>
      <div id="all-response" class="response">
        <div class="response-header">
          <span>Response:</span>
          <button class="close-btn" onclick="closeResponse('all-response')">Close</button>
        </div>
        <pre></pre>
      </div>
    </div>
  </div>

  <script>
    function fetchEndpoint(endpoint, responseId) {
      const responseElement = document.getElementById(responseId);
      const preElement = responseElement.querySelector('pre');
      
      // Show loading
      preElement.textContent = 'Loading...';
      responseElement.classList.add('response-visible');
      
      // Get the current hostname and port
      const host = window.location.host;
      const protocol = window.location.protocol;
      
      // Make the API request
      fetch(protocol + '//' + host + endpoint)
        .then(response => response.json())
        .then(data => {
          // Format and display the JSON response
          preElement.textContent = JSON.stringify(data, null, 2);
        })
        .catch(error => {
          preElement.textContent = 'Error: ' + error.message;
        });
    }
    
    function closeResponse(responseId) {
      const responseElement = document.getElementById(responseId);
      responseElement.classList.remove('response-visible');
    }
  </script>
</body>
</html>
''';
  }
}
