import 'package:flutter/material.dart';
import 'package:webapp/widgets/chart/sparkline_chart.dart';
import 'package:webapp/widgets/chart/pie_chart_widget.dart';
import 'package:webapp/widgets/users_table.dart'; // Import de la page UsersTable

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.table_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UsersTable()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Graphique Sparkline',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SparklineChart(),
              const SizedBox(height: 30),
              const Text(
                'Graphique en Camembert',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              PieChartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
