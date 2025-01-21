import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Blue": 25.0,
      "Red": 35.0,
      "Green": 40.0,
    };

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PieChart(
          dataMap: dataMap,
          chartType: ChartType.ring,
          colorList: [Colors.blue, Colors.red, Colors.green],
          chartRadius: MediaQuery.of(context).size.width / 2.5,
          legendOptions: LegendOptions(
            showLegends: true,
            legendPosition: LegendPosition.left,
          ),
          chartValuesOptions: ChartValuesOptions(
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValueBackground: false,
          ),
        ),
      ),
    );
  }
}
