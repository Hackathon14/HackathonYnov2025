import 'package:flutter/material.dart';

class UsersTable extends StatefulWidget {
  @override
  _UsersTableState createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  final List<Map<String, dynamic>> _users = [
    {
      'nom': 'Dupont',
      'prenom': 'Jean',
      'mail': 'jean.dupont@example.com',
      'commune': 'Paris',
      'type': 'web',
      'date': DateTime(2025, 1, 20),
    },
    {
      'nom': 'Durand',
      'prenom': 'Sophie',
      'mail': 'sophie.durand@example.com',
      'commune': 'Lyon',
      'type': 'mobile',
      'date': DateTime(2025, 1, 18),
    },
    {
      'nom': 'Martin',
      'prenom': 'Paul',
      'mail': 'paul.martin@example.com',
      'commune': 'Marseille',
      'type': 'admin',
      'date': DateTime(2025, 1, 15),
    },
  ];

  bool _isAscending = true; // Ordre de tri
  int _sortColumnIndex = 0; // Index de la colonne triée

  void _sort<T>(Comparable<T> Function(Map<String, dynamic> user) getField,
      int columnIndex, bool ascending) {
    _users.sort((a, b) {
      final fieldA = getField(a);
      final fieldB = getField(b);
      return ascending
          ? Comparable.compare(fieldA, fieldB)
          : Comparable.compare(fieldB, fieldA);
    });

    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau des Utilisateurs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection:
              Axis.horizontal, // Pour permettre le défilement horizontal
          child: DataTable(
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _isAscending,
            columns: [
              DataColumn(
                label: const Text('Nom'),
                onSort: (index, ascending) {
                  _sort((user) => user['nom'], index, ascending);
                },
              ),
              DataColumn(
                label: const Text('Prénom'),
                onSort: (index, ascending) {
                  _sort((user) => user['prenom'], index, ascending);
                },
              ),
              DataColumn(
                label: const Text('Email'),
                onSort: (index, ascending) {
                  _sort((user) => user['mail'], index, ascending);
                },
              ),
              DataColumn(
                label: const Text('Commune'),
                onSort: (index, ascending) {
                  _sort((user) => user['commune'], index, ascending);
                },
              ),
              DataColumn(
                label: const Text('Type'),
                onSort: (index, ascending) {
                  _sort((user) => user['type'], index, ascending);
                },
              ),
              DataColumn(
                label: const Text('Date de création'),
                onSort: (index, ascending) {
                  _sort((user) => user['date'], index, ascending);
                },
              ),
            ],
            rows: _users
                .map(
                  (user) => DataRow(
                    cells: [
                      DataCell(Text(user['nom'])),
                      DataCell(Text(user['prenom'])),
                      DataCell(Text(user['mail'])),
                      DataCell(Text(user['commune'])),
                      DataCell(Text(user['type'])),
                      DataCell(Text(
                          '${user['date'].day}/${user['date'].month}/${user['date'].year}')),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
