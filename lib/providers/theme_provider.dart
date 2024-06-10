import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get themeData {
    return _isDarkMode ? darkTheme : lightTheme;
  }
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF9B5DE5), // Amethyst purple
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF9B5DE5),
    secondary: const Color(0xFFF15BB5), // Lighter accent color
  ),
  hintColor: const Color(0xFF8AC3EF),
  scaffoldBackgroundColor: const Color(0xFFF7E1FF), // Light purple
  textTheme: const TextTheme(
    bodyLarge:
        TextStyle(color: Color(0xFF240046)), // Darker text color for contrast
    bodyMedium: TextStyle(color: Color(0xFF240046)),
    titleLarge: TextStyle(color: Color(0xFF9B5DE5)), // Heading color
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    filled: true,
    fillColor: const Color(0xFFF7E1FF),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      backgroundColor: const Color(0xFF9B5DE5), // Amethyst purple
      foregroundColor: Colors.white,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF9B5DE5), // Amethyst purple
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF9B5DE5), // Floating action button color
    foregroundColor: Colors.white, // Text color for floating action button
  ),
  cardColor: const Color(0xFFF7E1FF), // Card background color
  dividerColor: const Color(0xFFD6A2E8), // Divider color
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF9B5DE5), // Default button color
    textTheme: ButtonTextTheme.primary, // Button text theme
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF240046), // Darker shade for dark mode
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF240046),
    secondary: const Color(0xFF9B5DE5), // Lighter accent color for dark mode
  ),
  hintColor: const Color(0xFFF2F2F2),
  scaffoldBackgroundColor: const Color(0xFF10002B), // Very dark purple
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFF7E1FF)), // Light purple for contrast
    bodyMedium: TextStyle(color: Color(0xFFF7E1FF)),
    titleLarge: TextStyle(color: Color(0xFF9B5DE5)), // Heading color
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    filled: true,
    fillColor: const Color(0xFF240046),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      backgroundColor: const Color(0xFF9B5DE5), // Amethyst purple
      foregroundColor: Colors.white,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF240046), // Darker shade
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF9B5DE5), // Floating action button color
    foregroundColor: Colors.white, // Text color for floating action button
  ),
  cardColor: const Color(0xFF240046), // Card background color
  dividerColor: const Color(0xFF9B5DE5), // Divider color
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF9B5DE5), // Default button color
    textTheme: ButtonTextTheme.primary, // Button text theme
  ),
);

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Color> gradientColors;
  final Widget? leading;
  final List<Widget>? actions;

  const GradientAppBar({
    Key? key,
    required this.title,
    this.gradientColors = const [Color(0xFF9B5DE5), Color(0xFF240046)],
    this.leading,
    this.actions,
    required LinearGradient gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
