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
    return Scaffold(
      body: FutureBuilder(
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
          Text latitude = Text(
              "Latitude: ${dailyWeahterInformation["latitude"].toString()}");
          Text longitude = Text(
              "Longitude: ${dailyWeahterInformation["longitude"].toString()}");
          Text timezone = Text(
              "Timezone: ${dailyWeahterInformation["timezone"].toString()}");
          Text timezoneAbbreviation = Text(
              "Timezone abbreviation: ${dailyWeahterInformation["timezone_abbreviation"].toString()}");
          Text elevation = Text(
              "Elevation: ${dailyWeahterInformation["elevation"].toString()}");
          List<dynamic> dailyInformationData =
              dailyWeahterInformation["daily_information"];
          List<Card> dailyInfoWidgets = [];

          for (var dailyInfo in dailyInformationData) {
            Text time = Text(dailyInfo["time"]);
            var weatherCodeInfo = utils
                .transformWeatherCodeToIconAndText(dailyInfo["weather_code"]);
            Text weatherText = Text(weatherCodeInfo["text"]);
            Icon weatherIcon = Icon(weatherCodeInfo["icon"]);
            Text sunrise = Text(dailyInfo["sunrise"]);
            Text sunset = Text(dailyInfo["sunset"]);
            Text daylightDuration =
                Text(dailyInfo["daylight_duration"].toString());
            Text sunshineDuration =
                Text(dailyInfo["sunshine_duration"].toString());
            dailyInfoWidgets.add(
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: time),
                    Center(child: sunrise),
                    Center(child: weatherIcon),
                    Center(child: weatherText),
                    Center(child: sunset),
                  ],
                ),
              ),
            );
          }

          return GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            children: [...dailyInfoWidgets],
          );
        },
      ),
    );
  }
}
