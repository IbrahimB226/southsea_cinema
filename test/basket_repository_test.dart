import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repository/basket_repository.dart';

void main() {
  group('BasketRepository tests', () {
    late BasketRepository basket;

    final Movie movie = Movie(
      id: '1',
      title: 'Interstellar',
      synopsis: 'Test synopsis',
      ageRating: '12A',
      runtime: '169 min',
      screeningTime: '19:30',
      ticketPrice: 12.99,
      posterImagePath: 'assets/images/interstellar.jpg',
    );

    setUp(() {
      basket = BasketRepository();
    });

    test('addTicket adds movie to basket', () {
      basket.addTicket(movie);

      expect(basket.getBasketItems().length, 1);
    });

    test('removeTicket removes movie from basket', () {
      basket.addTicket(movie);
      basket.removeTicket(movie);

      expect(basket.getBasketItems().isEmpty, true);
    });

    test('clearBasket removes all items', () {
      basket.addTicket(movie);
      basket.addTicket(movie);

      basket.clearBasket();

      expect(basket.getBasketItems().isEmpty, true);
    });

    test('getTotalTickets returns item count', () {
      basket.addTicket(movie);
      basket.addTicket(movie);

      expect(basket.getTotalTickets(), 2);
    });

    test('getTotalPrice returns basket total', () {
      basket.addTicket(movie);
      basket.addTicket(movie);

      expect(basket.getTotalPrice(), 25.98);
    });
  });
}