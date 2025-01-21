import 'package:flutter/material.dart';
import 'features/auth/presentation/login_page.dart';
import 'features/auth/presentation/signup_page.dart';
import 'features/dashboard/presentation/dashboard_page.dart';
import 'features/home/presentation/homepage.dart'; // Import de la page d'accueil

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home', // Page d'accueil
      routes: {
        '/home': (context) => HomePage(), // Route pour la page d'accueil
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
