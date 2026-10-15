import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
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
}