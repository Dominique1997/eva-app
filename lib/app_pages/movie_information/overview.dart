import 'dart:convert';

import 'package:eva_app/app_pages/movie_information/detailed.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utils.dart';
import 'package:http/http.dart' as http;

class MovieInformationOverview extends StatefulWidget {
  const MovieInformationOverview({super.key});

  @override
  State<MovieInformationOverview> createState() =>
      _MovieInformationOverviewState();
}

class _MovieInformationOverviewState extends State<MovieInformationOverview> {
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: http.get(
          Uri.parse(
              "http://localhost:8000/api/omdb/search_movie?movie_name=iron_man"),
        ),
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
          http.Response jsonResponse = snapshot.data as http.Response;
          Map<String, dynamic> moviesInformation =
              json.decode(jsonResponse.body);
          List<dynamic> movies = moviesInformation["Search"];
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              String movieTitle = movies[index]["Title"];
              String moviePoster = movies[index]["Poster"];
              String movieYear = movies[index]["Year"];
              String movieImdbID = movies[index]["imdbID"];
              return GestureDetector(
                onTap: () {
                  http
                      .get(Uri.parse(
                          "http://localhost:8000/api/omdb/search_movie?movie_name=$movieImdbID"))
                      .then((value) {
                    Map<String, dynamic> movieInformation =
                        json.decode(value.body);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieInformationDetailed(
                            movieInformation: movieInformation["Search"]),
                      ),
                    );
                  });
                },
                child: Card(
                  child: Column(
                    children: [
                      Text(movieTitle),
                      const SizedBox(
                        height: 125,
                      ),
                      Image.network(
                        moviePoster,
                      ),
                      const SizedBox(
                        height: 125,
                      ),
                      Text(movieYear),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
