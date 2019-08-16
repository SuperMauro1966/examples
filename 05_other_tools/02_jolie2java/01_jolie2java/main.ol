include "ForecastInterface.iol"
include "console.iol"

execution{ concurrent }

inputPort Forecast {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: ForecastInterface
}


main {
  [ getTemperature( request )( response ) {
    if ( request.city == "Rome" ) {
      response = 32.4
    } else if ( request.city == "Cesena" ) {
      response = 30.1
    } else {
      response = 29.0
    }
  } ] { nullProcess }

  [ getWind( request )( response ) {
    if ( request.city == "Rome" ) {
      response = 1.40
    } else if ( request.city == "Cesena" ) {
      response = 2.01
    } else {
      response = 1.30
    }
  }] { nullProcess }
}
