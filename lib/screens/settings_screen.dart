import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transitwallet_app/providers/theme_provider.dart';
import 'package:transitwallet_app/screens/payment_history_screen.dart';
import 'package:transitwallet_app/widgets/custom_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key});

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: GradientAppBar(
        title: const Text('App Settings').data ?? '',
        gradient: LinearGradient(
          colors: purpleAmethystGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: purpleAmethystGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User Profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Manage Wallets'),
                onTap: () {
                  // Handle manage wallets tap
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Payment History',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('View Payment History'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentHistoryScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'User Settings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Edit Signature'),
                onTap: () {
                  // Handle edit signature tap
                },
              ),
              ListTile(
                title: const Text('Auto Payment'),
                onTap: () {
                  // Handle auto payment tap
                },
              ),
              ListTile(
                title: const Text('Set Reminders'),
                onTap: () {
                  // Handle set reminders tap
                },
              ),
              ListTile(
                title: const Text('Transaction Automation'),
                onTap: () {
                  // Handle transaction automation tap
                },
              ),
              ListTile(
                title: const Text('Support Center'),
                onTap: () {
                  // Handle support center tap
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  text: 'Log Out',
                  onPressed: () => _logout(context),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/payment');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/settings');
          }
        },
      ),
    );
  }
}
