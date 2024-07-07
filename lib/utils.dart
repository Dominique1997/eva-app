import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:weather_icons/weather_icons.dart';

class Utils {
  readJson(pathToJsonFile) async {
    final String response = await rootBundle.loadString(pathToJsonFile);
    return await json.decode(response);
  }

  transformWeatherCodeToIconAndText(weatherCode) {
    switch (weatherCode) {
      case 0:
        return {"icon": WeatherIcons.day_sunny, "text": "Clear sky"};
      case 1:
        return {"icon": WeatherIcons.day_cloudy, "text": "Mainly clear"};
      case 2:
        return {"icon": WeatherIcons.day_cloudy_gusts, "text": "Partly cloudy"};
      case 3:
        return {"icon": WeatherIcons.day_cloudy_windy, "text": "Overcast"};
      case 45:
        return {"icon": WeatherIcons.day_fog, "text": "Fog"};
      case 48:
        return {"icon": WeatherIcons.day_hail, "text": "Depositing rime fog"};
      case 51:
        return {
          "icon": WeatherIcons.day_haze,
          "text": "Drizzle: Light intensity"
        };
      case 53:
        return {
          "icon": WeatherIcons.day_lightning,
          "text": "Drizzle: Moderate intensity"
        };
      case 55:
        return {
          "icon": WeatherIcons.day_rain,
          "text": "Drizzle: Dense intensity"
        };
      case 56:
        return {
          "icon": WeatherIcons.day_rain_mix,
          "text": "Freezing Drizzle: Light intensity"
        };
      case 57:
        return {
          "icon": WeatherIcons.day_rain_wind,
          "text": "Freezing Drizzle: Dense intensity"
        };
      case 61:
        return {
          "icon": WeatherIcons.day_showers,
          "text": "Rain: Slight intensity"
        };
      case 63:
        return {
          "icon": WeatherIcons.day_sleet,
          "text": "Rain: Moderate intensity"
        };
      case 65:
        return {
          "icon": WeatherIcons.day_sleet_storm,
          "text": "Rain: Heavy intensity"
        };
      case 66:
        return {
          "icon": WeatherIcons.day_snow,
          "text": "Freezing Rain: Light intensity"
        };
      case 67:
        return {
          "icon": WeatherIcons.day_snow_thunderstorm,
          "text": "Freezing Rain: Heavy intensity"
        };
      case 71:
        return {
          "icon": WeatherIcons.day_snow_wind,
          "text": "Snow fall: Slight intensity"
        };
      case 73:
        return {
          "icon": WeatherIcons.day_sprinkle,
          "text": "Snow fall: Moderate intensity"
        };
      case 75:
        return {
          "icon": WeatherIcons.day_storm_showers,
          "text": "Snow fall: Heavy intensity"
        };
      case 77:
        return {"icon": WeatherIcons.day_sunny_overcast, "text": "Snow grains"};
      case 80:
        return {
          "icon": WeatherIcons.day_thunderstorm,
          "text": "Rain showers: Slight intensity"
        };
      case 81:
        return {
          "icon": WeatherIcons.day_windy,
          "text": "Rain showers: Moderate intensity"
        };
      case 82:
        return {
          "icon": WeatherIcons.solar_eclipse,
          "text": "Rain showers: Violent intensity"
        };
      case 85:
        return {
          "icon": WeatherIcons.hot,
          "text": "Snow showers: Slight intensity"
        };
      case 86:
        return {
          "icon": WeatherIcons.day_cloudy_high,
          "text": "Snow showers: Heavy intensity"
        };
      case 95:
        return {
          "icon": WeatherIcons.day_light_wind,
          "text": "Thunderstorm: Slight or moderate"
        };
      case 96:
        return {
          "icon": WeatherIcons.day_light_wind,
          "text": "Thunderstorm with slight hail"
        };
      case 99:
        return {
          "icon": WeatherIcons.day_light_wind,
          "text": "Thunderstorm with heavy hail"
        };
      default:
        return {"icon": WeatherIcons.na, "text": "Not available"};
    }
  }
}
