import 'package:flutter/material.dart';
import 'features/auth/login_page.dart';
import 'features/auth/signup_page.dart';
import 'features/dashboard/dashboard_page.dart';
import 'features/home/home_page.dart';
import 'features/classement/classement_page.dart';
import 'features/user_table/userstable_page.dart';

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
        '/classement': (context) => ClassementPage(),
        '/userstable': (context) => DataUserPage(),
      },
    );
  }
}
