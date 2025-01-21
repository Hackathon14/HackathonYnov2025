import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

class SparklineChart extends StatelessWidget {
  final List<double> data = [3, 1, 4, 6, 5, 7, 2];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Sparkline(
          data: data,
          lineColor: Colors.blueAccent,
          fillColor: Colors.blueAccent.withOpacity(0.3),
          pointsMode: PointsMode.all,
          pointColor: Colors.redAccent,
          sharpCorners: true,
          useCubicSmoothing: true,
        ),
      ),
    );
  }
}
