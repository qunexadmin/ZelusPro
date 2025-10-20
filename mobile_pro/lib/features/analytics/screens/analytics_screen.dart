import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:zelus_ui/zelus_ui.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Revenue Chart
            Text('Monthly Revenue', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 200,
                  child: BarChart(
                    BarChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      barGroups: List.generate(7, (i) => BarChartGroupData(x: i, barRods: [
                        BarChartRodData(toY: (i + 1) * 100.0, color: ZelusColors.gold, width: 20),
                      ])),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Top Services
            Text('Top Services', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 12),
            ...['Haircut', 'Color Treatment', 'Balayage', 'Beard Trim'].map((service) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: Text(service),
                trailing: const Text('\$1,200', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

