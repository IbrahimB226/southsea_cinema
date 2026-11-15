import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;

    if (cachedMovies != null) {
      return cachedMovies;
    }

    return [
      Movie(
        id: '1',
        title: 'Interstellar',
        synopsis:
            'A team of explorers travel through a wormhole in space in an attempt to ensure humanity survives.',
        ageRating: '12A',
        runtime: '169 min',
        screeningTime: '19:30',
        ticketPrice: 12.99,
        posterImagePath: 'assets/images/interstellar.jpg',
      ),
      Movie(
        id: '2',
        title: 'Shutter Island',
        synopsis:
            'A U.S. Marshal investigates the disappearance of a patient from a remote psychiatric hospital and uncovers disturbing secrets.',
        ageRating: '15',
        runtime: '138 min',
        screeningTime: '21:00',
        ticketPrice: 11.99,
        posterImagePath: 'assets/images/shutter_island.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString =
        await rootBundle.loadString(assetPath);

    final dynamic decodedData =
        jsonDecode(jsonString);

    final List<dynamic> jsonList =
        decodedData as List<dynamic>;

    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap =
          item as Map<String, dynamic>;

      final Movie movie =
          Movie.fromJson(itemMap);

      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;

    return loadedMovies;
  }
}