import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      final movie = Movie(
        id: 'interstellar',
        title: 'Interstellar',
        synopsis: 'A team of explorers travel through a wormhole in space.',
        ageRating: '12A',
        runtime: '169 min',
        screeningTime: '19:30',
        ticketPrice: 12.99,
        posterImagePath: 'assets/images/interstellar.jpg',
      );

      expect(movie.id, 'interstellar');
      expect(movie.title, 'Interstellar');
      expect(
        movie.synopsis,
        'A team of explorers travel through a wormhole in space.',
      );
      expect(movie.ageRating, '12A');
      expect(movie.runtime, '169 min');
      expect(movie.screeningTime, '19:30');
      expect(movie.ticketPrice, 12.99);
      expect(movie.posterImagePath, 'assets/images/interstellar.jpg');
    });

    test(
      'formattedPrice returns pound sign and two decimal places for pence values',
      () {
        final movie = Movie(
          id: 'test',
          title: 'Test Movie',
          synopsis: 'Test synopsis',
          ageRating: 'PG',
          runtime: '120 min',
          screeningTime: '18:00',
          ticketPrice: 12.99,
          posterImagePath: 'assets/images/interstellar.jpg',
        );

        expect(movie.formattedPrice, '£12.99');
      },
    );

    test(
      'formattedPrice returns pound sign and two decimal places for whole pounds',
      () {
        final movie = Movie(
          id: 'test',
          title: 'Test Movie',
          synopsis: 'Test synopsis',
          ageRating: 'PG',
          runtime: '120 min',
          screeningTime: '18:00',
          ticketPrice: 10.0,
          posterImagePath: 'assets/images/interstellar.jpg',
        );

        expect(movie.formattedPrice, '£10.00');
      },
    );

    test('fromJson creates Movie from JSON map', () {
      final Map<String, dynamic> json = {
        'id': '1',
        'title': 'Interstellar',
        'synopsis':
            'A team of explorers travel through a wormhole in space.',
        'ageRating': '12A',
        'runtime': '169 min',
        'screeningTime': '19:30',
        'ticketPrice': 12.99,
        'posterImagePath': 'assets/images/interstellar.jpg',
      };

      final Movie movie = Movie.fromJson(json);

      expect(movie.id, '1');
      expect(movie.title, 'Interstellar');
      expect(
        movie.synopsis,
        'A team of explorers travel through a wormhole in space.',
      );
      expect(movie.ageRating, '12A');
      expect(movie.runtime, '169 min');
      expect(movie.screeningTime, '19:30');
      expect(movie.ticketPrice, 12.99);
      expect(
        movie.posterImagePath,
        'assets/images/interstellar.jpg',
      );

      expect(movie.toJson(), json);
    });

    test(
      'fromJson converts whole number prices to double',
      () {
        final Map<String, dynamic> json = {
          'id': '3',
          'title': 'Test Movie',
          'synopsis': 'Test synopsis',
          'ageRating': 'PG',
          'runtime': '120 min',
          'screeningTime': '18:00',
          'ticketPrice': 10,
          'posterImagePath': 'assets/images/interstellar.jpg',
        };

        final Movie movie = Movie.fromJson(json);

        expect(movie.ticketPrice, 10.0);
        expect(movie.ticketPrice, isA<double>());
      },
    );
  });
}