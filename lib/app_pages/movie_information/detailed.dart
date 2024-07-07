import 'package:flutter/material.dart';
import 'package:eva_app/utils.dart';

class MovieInformationDetailed extends StatefulWidget {
  final Map<String, dynamic> movieInformation;
  const MovieInformationDetailed({super.key, required this.movieInformation});

  @override
  State<MovieInformationDetailed> createState() =>
      _MovieInformationDetailedState();
}

class _MovieInformationDetailedState extends State<MovieInformationDetailed> {
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> movieInformation = widget.movieInformation;
    String movieTitle = movieInformation["Title"];
    String movieYear = movieInformation["Year"];
    String movieReleased = movieInformation["Released"];
    String movieRuntime = movieInformation["Runtime"];
    String moviePoster = movieInformation["Poster"];
    String moviePlot = movieInformation["Plot"];
    return Wrap(children: [
      Column(
        children: [
          GestureDetector(
            child: const Icon(Icons.backspace_rounded),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Text(movieTitle),
          Image.network(moviePoster),
          Text(movieReleased),
          Text(movieRuntime),
          Text(movieYear),
          Text(
            moviePlot,
            textAlign: TextAlign.center,
          ),
        ],
      )
    ]);
  }
}
