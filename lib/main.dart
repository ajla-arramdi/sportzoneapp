import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/main_screen.dart';
import 'widgets/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/product_detail_screen.dart';
import 'models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final cart = CartState();
    return CartScope(
      notifier: cart,
      child: MaterialApp(
        title: 'Sport Station Zone',
        theme: AppTheme.lightTheme,
        darkTheme: ThemeData(
          // Dark theme
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppTheme.primaryCyan,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.openSansTextTheme(),
        ),
        routes: {
          '/': (_) => const MainScreen(),
          '/login': (_) => const LoginScreen(),
          '/register': (_) => const RegistrationScreen(),
          '/edit-profile': (_) => const EditProfileScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/product-detail') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => ProductDetailScreen(
                title: args['title'] as String,
                price: args['price'] as String,
                imageColor: args['imageColor'] as Color,
              ),
            );
          }
          return null;
        },
        initialRoute: '/login',
      ),
    );
  }
}
