import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';
import 'package:inventory_management_app/models/item_model.dart';

class GraphForDashboard extends StatelessWidget {
  const GraphForDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          top: 15,
        ),
        child: ValueListenableBuilder(
          valueListenable: graphPointListNotifier,
          builder: (context, pointList, child) => LineChart(
            LineChartData(
                maxX: 7,
                gridData: const FlGridData(
                  show: true,
                  drawVerticalLine: false,
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        DateTime date = getTheCurrentDateStartOrEnd(
                                currentDate: CurrentDate.week)
                            .add(Duration(days: value.toInt() - 1));
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            '${date.day}/${date.month}',
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: MyColors.lightGrey, width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: (pointList.isNotEmpty)
                        ? pointList
                        : const [FlSpot(0, 0)],
                    color: Colors.blue,
                    barWidth: 3,
                    dotData: const FlDotData(
                      show: true,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color.fromARGB(42, 40, 137, 217),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
