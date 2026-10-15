import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repository/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains valid Interstellar and Shutter Island', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie interstellar = movies[0];
      expect(interstellar.id, '1');
      expect(interstellar.title, 'Interstellar');
      expect(interstellar.ticketPrice, 12.99);
      expect(interstellar.posterImagePath, isNotEmpty);

      final Movie shutterIsland = movies[1];
      expect(shutterIsland.id, '2');
      expect(shutterIsland.title, 'Shutter Island');
      expect(shutterIsland.ticketPrice, 11.99);
      expect(shutterIsland.posterImagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('1');

      expect(movie, isNotNull);
      expect(movie?.title, 'Interstellar');
      expect(movie?.ticketPrice, 12.99);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('999');

      expect(movie, isNull);
    });
  });
}
