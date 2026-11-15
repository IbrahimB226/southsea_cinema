import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repository/basket_repository.dart';

void main() {
  group('BasketRepository tests', () {
    final BasketRepository basket = BasketRepository.instance;

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
      basket.clear();
    });

    test('addItem adds cart item', () {
      basket.addItem(
        CartItem(
          movie: movie,
          quantity: 2,
        ),
      );

      expect(basket.getItems().length, 1);
    });

    test('removeItem removes cart item', () {
      basket.addItem(
        CartItem(
          movie: movie,
          quantity: 2,
        ),
      );

      basket.removeItem(0);

      expect(basket.getItems().isEmpty, true);
    });

    test('totalItemCount returns combined quantity', () {
      basket.addItem(
        CartItem(
          movie: movie,
          quantity: 3,
        ),
      );

      expect(basket.totalItemCount, 3);
    });

    test('getSubtotal returns correct amount', () {
      basket.addItem(
        CartItem(
          movie: movie,
          quantity: 2,
        ),
      );

      expect(basket.getSubtotal(), 25.98);
    });

    test('clear removes all items', () {
      basket.addItem(
        CartItem(
          movie: movie,
          quantity: 2,
        ),
      );

      basket.clear();

      expect(basket.getItems().isEmpty, true);
    });
  });
}
