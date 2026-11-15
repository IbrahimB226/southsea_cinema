import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repository/basket_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  final BasketRepository basket = BasketRepository.instance;

  @override
  Widget build(BuildContext context) {
    final List<CartItem> items = basket.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Basket'),
      ),
      drawer: const NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MY ORDER',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: items.isEmpty
                  ? const Center(
                      child: Text(
                        'Your basket is empty',
                        style: TextStyle(
                          color: cinemaFontWhite,
                          fontSize: 20,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final CartItem item = items[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          color: cinemaSurface,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${item.quantity} Tickets',
                                  style: const TextStyle(
                                    color: cinemaBrand,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.movie.title,
                                      style: const TextStyle(
                                        color: cinemaBrand,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.movie.screeningTime,
                                      style: const TextStyle(
                                        color: cinemaBrand,
                                      ),
                                    ),
                                    Text(
                                      item.movie.runtime,
                                      style: const TextStyle(
                                        color: cinemaBrand,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '£${item.lineTotal.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: cinemaBrand,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      color: cinemaBrand,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            basket.removeItem(index);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 16),
            Text(
              'Tickets: ${basket.totalItemCount}',
              style: const TextStyle(
                color: cinemaFontWhite,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Subtotal: £${basket.getSubtotal().toStringAsFixed(2)}',
              style: const TextStyle(
                color: cinemaFontWhite,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Service Charge: £${basket.getServiceCharge().toStringAsFixed(2)}',
              style: const TextStyle(
                color: cinemaFontWhite,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Due: £${basket.getTotalDue().toStringAsFixed(2)}',
              style: const TextStyle(
                color: cinemaFontWhite,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: 'Clear Basket',
              onPressed: () {
                setState(() {
                  basket.clear();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}