import 'location.dart';
import 'networking.dart';

//http://api.weatherapi.com/v1/current.json?key=acc4067b1243458bb1191531230711&q=London&aqi=no
const apiKey = 'acc4067b1243458bb1191531230711';
const openWeatherMapURL = 'http://api.weatherapi.com/v1/current.json?key=';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL$apiKey&q=$cityName&aqi=no');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL$apiKey&q=${location.latitude},${location.longitude}&aqi=no');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition == 1087) {
      return '🌩';
    } else if (condition == 1213) {
      return '🌧';
    } else if (condition == 1189) {
      return '☔️';
    } else if (condition == 1225) {
      return '☃️';
    } else if (condition == 1147) {
      return '🌫';
    } else if (condition == 1000) {
      return '☀️';
    } else if (condition == 1006) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 25) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}