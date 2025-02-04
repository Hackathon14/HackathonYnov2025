import 'package:flutter/material.dart';
import 'package:webapp/widgets/navbar.dart';

class DataUserPage extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
      "nom": "Dupont",
      "prenom": "Jean",
      "email": "jean.dupont@gmail.com",
      "commune": "Paris",
      "type": "Mobile",
      "date": "2025-01-01"
    },
    {
      "nom": "Martin",
      "prenom": "Alice",
      "email": "alice.martin@gmail.com",
      "commune": "Lyon",
      "type": "Web",
      "date": "2025-01-02"
    },
    {
      "nom": "Durand",
      "prenom": "Paul",
      "email": "paul.durand@gmail.com",
      "commune": "Marseille",
      "type": "Admin",
      "date": "2025-01-03"
    },
  ];

  @override
  Widget build(BuildContext context) {
    int totalUsers = users.length;

    return Scaffold(
      appBar: const AppNavbar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Totaux en haut
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Utilisateurs : $totalUsers',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Tableau
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor:
                                MaterialStateProperty.all(Colors.grey.shade200),
                            columnSpacing: 20.0,
                            border: TableBorder.all(
                                color: Colors.grey.shade300, width: 1),
                            columns: const [
                              DataColumn(
                                label: Text(
                                  'Nom',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Prénom',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Email',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Commune',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Type',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Date de Création',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            rows: users
                                .map(
                                  (user) => DataRow(cells: [
                                    DataCell(Text(user['nom'])),
                                    DataCell(Text(user['prenom'])),
                                    DataCell(Text(user['email'])),
                                    DataCell(Text(user['commune'])),
                                    DataCell(Text(user['type'])),
                                    DataCell(Text(user['date'])),
                                  ]),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
