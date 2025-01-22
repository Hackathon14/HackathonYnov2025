import 'package:flutter/material.dart';
import 'package:webapp/widgets/navbar.dart';

class ClassementPage extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {"classement": 1, "nom": "Dupont", "prenom": "Jean", "co2": 120.5},
    {"classement": 2, "nom": "Martin", "prenom": "Alice", "co2": 110.2},
    {"classement": 3, "nom": "Durand", "prenom": "Paul", "co2": 95.7},
  ];

  @override
  Widget build(BuildContext context) {
    double totalCO2 = users.fold(0, (sum, user) => sum + user['co2']);
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
                        Text(
                          'Total CO2 produit : ${totalCO2.toStringAsFixed(1)} kg',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
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
                                  'Classement',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
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
                                  'CO2 Produit (kg)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            rows: users
                                .map(
                                  (user) => DataRow(cells: [
                                    DataCell(
                                        Text(user['classement'].toString())),
                                    DataCell(Text(user['nom'])),
                                    DataCell(Text(user['prenom'])),
                                    DataCell(Text('${user['co2']}')),
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
