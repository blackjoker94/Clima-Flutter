import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

late double latitude;
late double longitude;
const API_key = "c78fd628e80409467caa0fe01ec77870";
const API_URL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$API_URL?q=$cityName&appid=$API_key');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location l1 = new Location();
    await l1.getCurrentLocation();
    latitude = l1.latitude;
    longitude = l1.longitude;
    var weatherData = await NetworkHelper(
            '$API_URL?lat=$latitude&lon=$longitude&appid=$API_key')
        .getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
