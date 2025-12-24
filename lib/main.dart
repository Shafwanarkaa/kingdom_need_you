
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'screens/home_screen.dart';
import 'services/cart_service.dart'; // Import the new CartService

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap the entire app with a ChangeNotifierProvider.
    // This makes the CartService available to all widgets in the app.
    return ChangeNotifierProvider(
      create: (context) => CartService(),
      child: MaterialApp(
        title: 'Kingdom Need You',
        theme: ThemeData(
          // Define the primary color scheme for the app.
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            primary: Colors.red.shade900, // A deeper red for primary elements
            secondary: Colors.amber.shade700, // A golden accent color
            background: Colors.grey.shade100, // A light grey background
          ),
          // Define the app bar theme.
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.red.shade900,
            foregroundColor: Colors.white, // White text and icons on the app bar
            elevation: 4,
            centerTitle: true,
          ),
          // Define the bottom navigation bar theme.
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.red.shade900, // Color for the selected icon
            unselectedItemColor: Colors.grey.shade600, // Color for unselected icons
            showUnselectedLabels: true,
          ),
          // Use Material 3 design.
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
