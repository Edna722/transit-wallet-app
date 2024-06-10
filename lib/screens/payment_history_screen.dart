import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transitwallet_app/providers/theme_provider.dart';

final List<Color> purpleAmethystGradient = [
  const Color(0xFF9B5DE5),
  const Color(0xFF240046)
];

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: GradientAppBar(
        title: const Text('Payment History').data ??
            '', // Extract text from Text widget
        gradient: LinearGradient(
          colors: purpleAmethystGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
          child: ListView(
            children: [
              _buildPaymentHistoryItem(
                month: 'January',
                transactions: ['Bus Payment'],
                averageAmount: 100.0, // Average amount for January
              ),
              _buildPaymentHistoryItem(
                month: 'February',
                transactions: ['Matatu Payment'],
                averageAmount: 150.0, // Average amount for February
              ),
              _buildPaymentHistoryItem(
                month: 'March',
                transactions: ['Bus Payment', 'Matatu Payment'],
                averageAmount: 120.0, // Average amount for March
              ),
              _buildPaymentHistoryItem(
                month: 'April',
                transactions: ['Bus Payment'],
                averageAmount: 90.0, // Average amount for April
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentHistoryItem({
    required String month,
    required List<String> transactions,
    required double averageAmount,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payments for $month',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(transactions[index]),
                  trailing: Text('KES'), // Wrap 'KES' with Text widget
                );
              },
            ),
            SizedBox(height: 8.0),
            Text(
              'Average Amount: KES $averageAmount',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
