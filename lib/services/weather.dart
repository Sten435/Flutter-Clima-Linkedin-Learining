import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  final apiKey = "91607f3a43753e9533c57add81801360";

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

  Future<dynamic> getLocationWeather() async {
    UserLocation location = UserLocation();
    await location.getCurrentLocation();

    NetworkHandler networkHandler = NetworkHandler();
    return await networkHandler.fetch("api.openweathermap.org", "/data/2.5/weather", {"lat": location.latitude.toString(), "lon": location.longitude.toString(), "appid": apiKey, "units": "metric"});
  }

  Future<dynamic> getCityWeather(String city) async {
    NetworkHandler networkHandler = NetworkHandler();
    return await networkHandler.fetch("api.openweathermap.org", "/data/2.5/weather", {"q": city, "appid": apiKey, "units": "metric"});
  }
}
