import 'package:flutter/material.dart';
import 'package:transitwallet_app/screens/home_screen.dart';
import 'package:transitwallet_app/widgets/custom_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:transitwallet_app/providers/theme_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final themeProvider = Provider.of<ThemeProvider>(context);

    Future<void> _login() async {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if (userCredential.user != null) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  HomeScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    }

    return Scaffold(
      appBar: GradientAppBar(
        title: const Text('Login').data ?? '',
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                labelText: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                labelText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  _login();
                },
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
