import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

const String prefAddress = 'user_address';
const String prefEmail = 'user_email';
const String prefPatronNumber = 'user_patron_number';
const String prefReceiveNews = 'user_receive_news';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final TextEditingController _addressController =
      TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _patronNumberController =
      TextEditingController();

  bool _receiveNews = true;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();

    final String? savedAddress =
        await prefs.getString(prefAddress);

    final String? savedEmail =
        await prefs.getString(prefEmail);

    final String? savedPatronNumber =
        await prefs.getString(prefPatronNumber);

    final bool? savedReceiveNews =
        await prefs.getBool(prefReceiveNews);

    String address =
        'Buckingham Building,\nLion Terrace,\nPortsmouth\nPO1 3HE';

    if (savedAddress != null) {
      address = savedAddress;
    }

    String email = 'alex@example.com';

    if (savedEmail != null) {
      email = savedEmail;
    }

    String patronNumber = '1234';

    if (savedPatronNumber != null) {
      patronNumber = savedPatronNumber;
    }

    bool receiveNews = true;

    if (savedReceiveNews != null) {
      receiveNews = savedReceiveNews;
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _addressController.text = address;
      _emailController.text = email;
      _patronNumberController.text = patronNumber;
      _receiveNews = receiveNews;
    });
  }

  Future<void> _saveSettings() async {
    final String address =
        _addressController.text.trim();

    final String email =
        _emailController.text.trim();

    final String patronNumber =
        _patronNumberController.text.trim();

    final SharedPreferencesAsync prefs =
        SharedPreferencesAsync();

    await prefs.setString(
      prefAddress,
      address,
    );

    await prefs.setString(
      prefEmail,
      email,
    );

    await prefs.setString(
      prefPatronNumber,
      patronNumber,
    );

    await prefs.setBool(
      prefReceiveNews,
      _receiveNews,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _message = 'Settings saved';
    });
  }

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
          crossAxisAlignment:
              CrossAxisAlignment.start,
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
                      _loadSettings();

                      setState(() {
                        _message =
                            'Changes discarded';
                      });
                    },
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: PrimaryButton(
                    label: 'Save Settings',
                    onPressed: _saveSettings,
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