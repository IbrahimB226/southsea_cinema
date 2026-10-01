import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SHUTTER ISLAND (2010) (15)',
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 20),
            Text(
              'In 1954, U.S. Marshal Teddy Daniels travels to Ashecliffe '
              'Hospital, a remote island asylum for the criminally insane, '
              'to investigate the disappearance of a patient. As a storm '
              'cuts the island off from the mainland, he begins to suspect '
              'that nothing at the hospital is what it seems.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 50),
            Text(
              'Southsea Cinema Room',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 18),
            Text(
              'Friday 2nd October 2026, 17:30 - ends at 20:30',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 60),
            Text(
              'Please note that Discounts / Membership Benefits will be '
              'applied once you have selected your tickets',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 18),
            Text(
              'Select Quantities (Up to 5 in total)',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 40),
            Text(
              'Tickets',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Text('Adult (£7.50)', style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}