import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/database_provider.dart';

class ExpensesPieChart extends StatelessWidget {
  const ExpensesPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      final dataMap = <String, double>{};
      for (var cat in db.categories) {
        if (cat.totalAmount > 0) {
          dataMap[cat.title] = cat.totalAmount.toDouble();
        }
      }
      if (dataMap.isEmpty) {
        return const Center(child: Text('No data available.'));
      }
      final sections = dataMap.entries
          .map(
            (e) => PieChartSectionData(
          value: e.value,
          title: e.key,
          radius: 50,
          titleStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      )
          .toList();

      return PieChart(
        PieChartData(
          sections: sections,
          sectionsSpace: 2,
          centerSpaceRadius: 30,
          borderData: FlBorderData(show: false),
        ),
      );
    });
  }
}
