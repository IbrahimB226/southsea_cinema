import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

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
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: cinemaBackground,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SHUTTER ISLAND (2010) (15+)',
                style: TextStyle(color: cinemaFontWhite, fontSize: 34),
              ),
              SizedBox(height: 50),
              Text(
                'Southsea Cinema Room',
                style: TextStyle(color: cinemaFontWhite, fontSize: 20),
              ),
              SizedBox(height: 18),
              Text(
                'Friday 2nd October 2026, 17:30 - ends at 20:30',
                style: TextStyle(color: cinemaFontWhite, fontSize: 20),
              ),
              SizedBox(height: 60),
              Text(
                'Please note that Discounts / Membership Benefits will be '
                'applied once you have selected your tickets',
                style: TextStyle(color: cinemaFontWhite, fontSize: 20),
              ),
              SizedBox(height: 18),
              Text(
                'Select Quantities (Up to 5 in total)',
                style: TextStyle(color: cinemaFontWhite, fontSize: 20),
              ),
              SizedBox(height: 40),
              Text(
                'Tickets',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  DropdownMenu<int>(
                    width: 125,
                    initialSelection: 0,
                    textStyle: TextStyle(color: Colors.black),
                    trailingIcon:
                        Icon(Icons.arrow_drop_down, color: Colors.black),
                    inputDecorationTheme: InputDecorationTheme(
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
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: 0, label: '0'),
                      DropdownMenuEntry(value: 1, label: '1'),
                      DropdownMenuEntry(value: 2, label: '2'),
                      DropdownMenuEntry(value: 3, label: '3'),
                      DropdownMenuEntry(value: 4, label: '4'),
                      DropdownMenuEntry(value: 5, label: '5'),
                    ],
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Adult (£7.50)',
                    style: TextStyle(color: cinemaFontWhite, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _message = '$_quantity ticket(s) added to your order';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: Colors.white,
                  minimumSize: Size(150, 40),
                  shape: RoundedRectangleBorder(),
                ),
                child: Text('ADD TO ORDER', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 20),
              Text(
                _message,
                style: TextStyle(color: cinemaFontWhite, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
