import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Expense_modal.dart';


class ExpensePieChart extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensePieChart({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {};
    for (var expense in expenses) {
      dataMap.update(expense.category, (value) => value + expense.amount,
          ifAbsent: () => expense.amount);
    }

    final List<PieChartSectionData> sections = dataMap.entries.map((entry) {
      final double value = entry.value;
      final String category = entry.key;
      final Color color = _getCategoryColor(category);
      return PieChartSectionData(
        color: color,
        value: value,
        title: value.toStringAsFixed(1),
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();

    return PieChart(
      PieChartData(
        sections: sections,
        sectionsSpace: 2,
        centerSpaceRadius: 30,
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Food':
        return Colors.redAccent;
      case 'Transport':
        return Colors.blueAccent;
      case 'Entertainment':
        return Colors.green;
      case 'Bills':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
