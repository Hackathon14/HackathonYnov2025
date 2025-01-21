import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan & Win'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Nom du site en gros
            Text(
              'Scan & Win',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 40),
            // Bouton "Classement"
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page de classement
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Text('Classement'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Couleur du bouton
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            // Bouton "Connexion"
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page de connexion
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Connexion'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Couleur du bouton
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
