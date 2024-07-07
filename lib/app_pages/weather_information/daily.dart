import 'package:flutter/material.dart';
import 'package:eva_app/utils.dart';

class DailyWeatherInformation extends StatefulWidget {
  const DailyWeatherInformation({super.key});

  @override
  State<DailyWeatherInformation> createState() =>
      _DailyWeatherInformationState();
}

class _DailyWeatherInformationState extends State<DailyWeatherInformation> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    return FutureBuilder(
      future: utils.readJson("json_files/daily_weather_information.json"),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("ERROR:${snapshot.error}"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text("No data is available"),
          );
        }
        Map<String, dynamic> dailyWeahterInformation =
            snapshot.data as Map<String, dynamic>;
        Text latitude =
            Text("Latitude: ${dailyWeahterInformation["latitude"].toString()}");
        Text longitude = Text(
            "Longitude: ${dailyWeahterInformation["longitude"].toString()}");
        Text timezone =
            Text("Timezone: ${dailyWeahterInformation["timezone"].toString()}");
        Text timezoneAbbreviation = Text(
            "Timezone abbreviation: ${dailyWeahterInformation["timezone_abbreviation"].toString()}");
        Text elevation = Text(
            "Elevation: ${dailyWeahterInformation["elevation"].toString()}");
        List<dynamic> dailyInformationData =
            dailyWeahterInformation["daily_information"];
        List<Widget> dailyInformationWidgets = [];
        for (Map<String, dynamic> dailyInfo in dailyInformationData) {
          Text time = Text(dailyInfo["time"]);
          var weather_code_info = utils
              .transformWeatherCodeToIconAndText(dailyInfo["weather_code"]);
          Text weather_text = Text(weather_code_info["text"]);
          Icon weather_icon = Icon(weather_code_info["icon"]);
          Text sunrise = Text(dailyInfo["sunrise"]);
          Text sunset = Text(dailyInfo["sunset"]);
          Text daylight_duration =
              Text(dailyInfo["daylight_duration"].toString());
          Text sunshine_duration =
              Text(dailyInfo["sunshine_duration"].toString());
          dailyInformationWidgets.add(
            Card(
                child: Column(
              children: [
                time,
                weather_text,
                weather_icon,
                sunrise,
                sunset,
                daylight_duration,
                sunshine_duration,
              ],
            )),
          );
        }

        return ListView(
          children: [
            latitude,
            longitude,
            timezone,
            timezoneAbbreviation,
            elevation,
            ...dailyInformationWidgets
          ],
        );
      },
    );
  }
}
