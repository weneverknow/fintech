import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FintechLineChart extends StatefulWidget {
  const FintechLineChart({Key? key}) : super(key: key);

  @override
  _FintechLineChartState createState() => _FintechLineChartState();
}

class _FintechLineChartState extends State<FintechLineChart> {
  bool isStart = false;

  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   updateLine();
    // });
    updateLine();
    super.initState();
  }

  void updateLine() {
    Future ft = Future(() {});
    ft.then((value) {
      return Future.delayed(Duration(milliseconds: 1000), () {
        setState(() {
          isStart = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: LineChart(sampleData()),
    );
  }

  LineChartData sampleData() {
    return LineChartData(
        lineTouchData: LineTouchData(enabled: false),
        gridData: FlGridData(
          show: false,
          drawHorizontalLine: false,
          // getDrawingVerticalLine: (value) {
          //   return FlLine(color: Color(0xFF43B15F), strokeWidth: 1);
          // },
          // getDrawingHorizontalLine: (value) {
          //   return FlLine(color: Color(0xFFB1436D), strokeWidth: 1);
          // }
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTextStyles: (value) => TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 1:
                    return 'Feb';

                  case 3:
                    return 'Apr';

                  case 5:
                    return 'Jun';

                  case 7:
                    return 'Aug';
                  case 9:
                    return 'Oct';
                }
                return '';
              },
              //interval: 10,
              margin: 8),
          leftTitles: SideTitles(
              showTitles: false,
              getTextStyles: (value) => TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 1:
                    return '10K';
                  case 3:
                    return '30K';
                  case 5:
                    return '50K';
                  case 7:
                    return '80K';
                }
                return '';
              },
              reservedSize: 22,
              margin: 12),
        ),
        borderData: FlBorderData(
            show: false,
            border: Border.all(color: Color(0xff6326fb).withOpacity(0.3))),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
              spots: [
                FlSpot(0, !isStart ? 3.44 : 1),
                FlSpot(1, !isStart ? 3.44 : 3.1),
                FlSpot(2.5, !isStart ? 3.44 : 3.9),
                FlSpot(4.2, !isStart ? 3.44 : 2.0),
                FlSpot(5.5, !isStart ? 3.44 : 4.7),
                FlSpot(6.5, !isStart ? 3.44 : 5.2),
                FlSpot(8.4, !isStart ? 3.44 : 2.9),
                FlSpot(9.5, !isStart ? 3.44 : 1.2),
                FlSpot(10.5, !isStart ? 3.44 : 1.7),
                FlSpot(11.1, !isStart ? 3.44 : 5.4),
              ],
              isCurved: true,
              colors: [
                ColorTween(
                        begin: Color(0xffdeb1e5).withOpacity(0.4),
                        end: Color(0xffdeb1e5))
                    .lerp(0.2)!,
                ColorTween(
                        begin: Color(0xffdeb1e5).withOpacity(0.4),
                        end: Color(0xffdeb1e5))
                    .lerp(0.2)!
              ],
              barWidth: 8,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false, colors: [
                ColorTween(
                        begin: Color(0xff9268a6).withOpacity(0.3),
                        end: Color(0xff9268a6).withOpacity(0.2))
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(
                        begin: Color(0xff9268a6).withOpacity(0.3),
                        end: Color(0xff9268a6).withOpacity(0.2))
                    .lerp(0.2)!
                    .withOpacity(0.1)
              ]))
        ]);
  }
}
