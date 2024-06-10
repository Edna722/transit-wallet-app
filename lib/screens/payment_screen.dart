import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transitwallet_app/providers/theme_provider.dart';
import 'package:transitwallet_app/widgets/custom_widgets.dart';
import 'package:intasend_flutter/models/checkout.dart';
import 'package:intasend_flutter/intasend_flutter.dart';

final List<Color> purpleAmethystGradient = [
  Color(0xFF9B5DE5),
  Color(0xFF240046)
];

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  void initiatePayment(BuildContext context) {
    Checkout checkout = Checkout(
      publicKey:
          "ISPubKey_test_0049bc17-0ea6-4152-ad6a-e7fa1aa48aa3", // Replace with your actual public key
      amount: 10.01,
      email: "joe@doe.com",
      currency: "USD",
      firstName: "Joe",
      lastName: "Doe",
    );

    IntasendFlutter.initCheckout(
      test: true,
      checkout: checkout,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: GradientAppBar(
        title: const Text('TransitWallet').data ?? '',
        gradient: LinearGradient(
          colors: purpleAmethystGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        actions: const [
          ThemeToggleSwitch(),
        ],
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
                'Manage your transport payments with ease and security.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              const Text(
                'Make a Payment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Wallet Number',
                ),
              ),
              SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Amount (Ksh)',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  initiatePayment(context);
                },
                child: Text('Make Payment'),
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
