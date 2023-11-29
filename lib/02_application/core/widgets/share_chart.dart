import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ShareChart extends StatelessWidget {
  late final List<FlSpot> spots;
  final double minY;
  final double maxY;

  ShareChart({super.key, required List<(double,double)> spots, required this.minY, required this.maxY}){
    this.spots = spots.map((e) => FlSpot(e.$1, e.$2)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: spots.length.toDouble(),
        minY: minY,
        maxY: maxY,
        backgroundColor: Colors.white,
        titlesData: const FlTitlesData(show: false),
        lineTouchData: LineTouchData(
          enabled: true,
          //on touch, the line draws always on the next point
          touchSpotThreshold: 300.5,
          //on touch, the line draws to the top (6.0 = maxY)
          getTouchLineEnd: (LineChartBarData barData, int index) {
            return 6.0;
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(color: Colors.black12, width: 1),
            left: BorderSide(color: Colors.black12, width: 1),
            right: BorderSide(color: Colors.transparent),
            top: BorderSide(color: Colors.transparent),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 2,
          getDrawingHorizontalLine: (value) => const FlLine(
            color: Colors.black12,
            strokeWidth: 1,
          ),
        ),
        lineBarsData: [
          LineChartBarData(spots: spots)
        ],
      ),
    );
  }
}
