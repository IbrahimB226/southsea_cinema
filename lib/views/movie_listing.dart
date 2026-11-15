import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({
    super.key,
    required this.movie,
  });

  @override
  State<MovieListing> createState() {
    return _MovieListingState();
  }
}

class _MovieListingState extends State<MovieListing> {
  int _quantity = 0;
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: cinemaBackground,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.movie.title} (${widget.movie.ageRating})',
                style: const TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 34,
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(
                widget.movie.posterImagePath,
                height: 250,
              ),
              const SizedBox(height: 30),
              const Text(
                'Southsea Cinema Room',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                widget.movie.screeningTime,
                style: const TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                widget.movie.synopsis,
                style: const TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Tickets (${widget.movie.formattedPrice} each)',
                style: const TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              DropdownMenu<int>(
                width: 125,
                initialSelection: 0,
                textStyle: const TextStyle(color: Colors.black),
                trailingIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                inputDecorationTheme: const InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
                onSelected: (int? value) {
                  if (value != null) {
                    setState(() {
                      _quantity = value;
                    });
                  }
                },
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 0, label: '0'),
                  DropdownMenuEntry(value: 1, label: '1'),
                  DropdownMenuEntry(value: 2, label: '2'),
                  DropdownMenuEntry(value: 3, label: '3'),
                  DropdownMenuEntry(value: 4, label: '4'),
                  DropdownMenuEntry(value: 5, label: '5'),
                ],
              ),
              const SizedBox(height: 35),
                PrimaryButton(
                  label: 'Add to order',
                  onPressed: () {
                    setState(() {
                      _message =
                          '$_quantity ticket(s) added to your order';
                    });
                  },
                ),
              const SizedBox(height: 20),
              Text(
                _message,
                style: const TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}