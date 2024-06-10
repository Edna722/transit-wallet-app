import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:transitwallet_app/providers/theme_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAdGv2DEn2vKBu4sAoZLy6GmLuZ4Z0xjxI",
      appId: "1:813839744728:android:de985b6347d69b50fd21ad",
      messagingSenderId: "813839744728",
      projectId: "transitwallet-5e782",
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const TransitWalletApp(),
    ),
  );
}

class TransitWalletApp extends StatelessWidget {
  const TransitWalletApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'TransitWallet',
          theme: themeProvider.themeData,
          initialRoute: '/',
          routes: {
            '/': (context) => const WelcomeScreen(),
            '/signup': (context) => const SignupScreen(),
            '/login': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
            '/payment': (context) => const PaymentScreen(),
            '/settings': (context) => const SettingsScreen(),
          },
        );
      },
    );
  }
}
