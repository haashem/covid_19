import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';


class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final void Function() onPress;
  const InfoCard({Key key, this.title, this.effectedNum, this.iconColor, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: onPress,
                  child: Container(
            width: constraints.maxWidth / 2 - 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.12),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/running.svg',
                          width: 12,
                          height: 12,
                          color: iconColor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(title)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: kTextColor),
                              children: [
                                TextSpan(
                                  text: '$effectedNum \n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'People',
                                  style: TextStyle(fontSize: 12, height: 2),
                                ),
                              ]),
                        ),
                      ),
                      Expanded(child: LineReportChart()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LineReportChart extends StatelessWidget {
  const LineReportChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
                spots: getSpots(),
                isCurved: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
                colors: [kPrimaryColor],
                barWidth: 4.0),
          ],
        ),
      ),
    );
  }

  List<FlSpot> getSpots() {
    return [
      FlSpot(0, 0.5),
      FlSpot(1, 1.5),
      FlSpot(2, 0.5),
      FlSpot(3, 0.7),
      FlSpot(4, 0.2),
      FlSpot(5, 2),
      FlSpot(6, 1.5),
      FlSpot(7, 1.7),
      FlSpot(8, 1),
      FlSpot(9, 2.8),
      FlSpot(10, 2.5),
      FlSpot(11, 2.65)
    ];
  }
}
