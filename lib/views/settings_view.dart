import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final TextEditingController _addressController = TextEditingController(
    text: 'Buckingham Building,\nLion Terrace,\nPortsmouth\nPO1 3HE',
  );

  final TextEditingController _emailController = TextEditingController(
    text: 'alex@example.com',
  );

  final TextEditingController _patronNumberController = TextEditingController(
    text: '1234',
  );

  bool _receiveNews = true;
  String _message = '';

  @override
  void dispose() {
    _addressController.dispose();
    _emailController.dispose();
    _patronNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Settings'),
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Settings',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Address',
              style: TextStyle(
                color: cinemaBrand,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _addressController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Email Address',
              style: TextStyle(
                color: cinemaBrand,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Patron Number',
              style: TextStyle(
                color: cinemaBrand,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _patronNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Preferences',
              style: TextStyle(
                color: cinemaBrand,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text(
                'Receive news by email',
                style: TextStyle(
                  color: cinemaFontWhite,
                ),
              ),
              value: _receiveNews,
              activeThumbColor: cinemaBrand,
              onChanged: (value) {
                setState(() {
                  _receiveNews = value;
                });
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    label: 'Cancel',
                    onPressed: () {
                      setState(() {
                        _addressController.text =
                            'Buckingham Building,\nLion Terrace,\nPortsmouth\nPO1 3HE';

                        _emailController.text = 'alex@example.com';

                        _patronNumberController.text = '1234';

                        _receiveNews = true;

                        _message = 'Changes discarded';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: PrimaryButton(
                    label: 'Save Settings',
                    onPressed: () {
                      setState(() {
                        _message = 'Settings saved';
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _message,
              style: const TextStyle(
                color: cinemaBrand,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
