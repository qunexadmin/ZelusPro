import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:zelus_ui/zelus_ui.dart';
import 'package:zelus_core/zelus_core.dart';

class EarningsScreen extends ConsumerStatefulWidget {
  const EarningsScreen({super.key});

  @override
  ConsumerState<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends ConsumerState<EarningsScreen> {
  String _selectedPeriod = 'Week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ZelusColors.background,
      appBar: AppBar(
        title: Text(
          'Earnings',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: ZelusColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: ZelusColors.border.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: PopupMenuButton<String>(
              initialValue: _selectedPeriod,
              icon: const Icon(Icons.filter_list, size: 22),
              onSelected: (value) => setState(() => _selectedPeriod = value),
              itemBuilder: (context) => ['Today', 'Week', 'Month', 'Year']
                  .map((period) => PopupMenuItem(value: period, child: Text(period)))
                  .toList(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modern Total Earnings Card
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: ZelusColors.primaryGradient,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: ZelusColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Total Earnings',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '\$2,450',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'This $_selectedPeriod',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Stats Row with modern cards
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ZelusColors.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ZelusColors.border.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ZelusColors.success.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.trending_up, color: ZelusColors.success, size: 24),
                        ),
                        const SizedBox(height: 12),
                        const Text('28', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 4),
                        Text('Bookings', style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZelusColors.textSecondary,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ZelusColors.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ZelusColors.border.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ZelusColors.warning.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.attach_money, color: ZelusColors.warning, size: 24),
                        ),
                        const SizedBox(height: 12),
                        const Text('\$87', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 4),
                        Text('Avg/Booking', style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZelusColors.textSecondary,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Chart
            Text(
              'Earnings Trend',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 200,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            const FlSpot(0, 300),
                            const FlSpot(1, 450),
                            const FlSpot(2, 380),
                            const FlSpot(3, 520),
                            const FlSpot(4, 480),
                            const FlSpot(5, 550),
                            const FlSpot(6, 600),
                          ],
                          isCurved: true,
                          color: ZelusColors.gold,
                          barWidth: 3,
                          dotData: FlDotData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...[
              {'name': 'Sarah Wilson', 'service': 'Haircut', 'amount': 80.0, 'date': DateTime.now().subtract(const Duration(hours: 2))},
              {'name': 'Emily Chen', 'service': 'Color', 'amount': 150.0, 'date': DateTime.now().subtract(const Duration(hours: 5))},
              {'name': 'Michael Brown', 'service': 'Beard Trim', 'amount': 30.0, 'date': DateTime.now().subtract(const Duration(days: 1))},
            ].map((t) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ZelusColors.success.withOpacity(0.1),
                  child: const Icon(Icons.attach_money, color: ZelusColors.success, size: 20),
                ),
                title: Text(t['name'] as String),
                subtitle: Text('${t['service']} • ${DateFormatter.formatTimeAgo(t['date'] as DateTime)}'),
                trailing: Text(
                  '+\$${t['amount']}',
                  style: const TextStyle(
                    color: ZelusColors.success,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

