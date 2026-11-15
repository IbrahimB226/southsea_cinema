import 'package:southsea_cinema/models/movie.dart';

class BasketRepository {
  final List<Movie> _basket = [];

  void addTicket(Movie movie) {
    _basket.add(movie);
  }

  void removeTicket(Movie movie) {
    _basket.remove(movie);
  }

  void clearBasket() {
    _basket.clear();
  }

  List<Movie> getBasketItems() {
    return List.unmodifiable(_basket);
  }

  int getTotalTickets() {
    return _basket.length;
  }

  double getTotalPrice() {
    double total = 0;

    for (final movie in _basket) {
      total += movie.ticketPrice;
    }

    return total;
  }
}