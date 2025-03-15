import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget{
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  const Input({super.key,required this.label,required this.controller,required this.inputType});

  @override
  Widget build(BuildContext context){
    final input = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(0),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'IBM Plex Mono',
              color: Color(0xff1976D2)
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            textInputAction: TextInputAction.next,
            cursorColor: const Color(0xff64B5F6),
            style: const TextStyle(
              height: 1.4,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'IBM Plex Mono',
              color: Color(0xff64B5F6)
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff1976D2),
                  width: 3
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff1976D2),
                  width: 3
                )
              ),
            ),
          ),
        )
      ],
    );

    return Container(
      padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
      child: input,
    );
  }
}

class DashboardChart extends StatelessWidget{
  const DashboardChart({super.key});

  @override
  Widget build (BuildContext context){
    List<String> days = ["Mon","Tue","Wed","Thur","Fri","Sat","Sun"];

    SideTitles bottomTitles() => SideTitles(
      getTitlesWidget: (double val,TitleMeta meta){
        return SideTitleWidget(
          meta: meta,
          child: Text(
            days[val.toInt()],
            style: const TextStyle(
              fontFamily: "IBM Plex Mono",
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Colors.black
            ),
          ),
        );
      },
      showTitles: true,
      interval: 1,
    );

    SideTitles leftTitles() => SideTitles(
      getTitlesWidget: (double val,TitleMeta meta){
        return SideTitleWidget(
          meta: meta,
          child: Text(
            (val.toInt()).toString(),
            style: const TextStyle(
              fontFamily: "IBM Plex Mono",
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Colors.black
            ),
          ),
        );
      },
      showTitles: true,
      interval: 1,
    );

    final widget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 2,bottom: 2,right: 10,left: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Color(0xff1976D2)
          ),
          child: const Text(
            "Week",
            style: TextStyle(
              fontSize: 12,
              fontFamily: "IBM Plex Mono",
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Expanded(
          child: Container(
            padding: EdgeInsets.zero,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(
                  drawHorizontalLine: false,
                  drawVerticalLine: false,
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: bottomTitles()
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: leftTitles()
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)
                  )
                ),
                borderData: FlBorderData(
                  show: false
                ),
                minX: 0,
                maxX: 6,
                lineBarsData: [
                  LineChartBarData(
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff64B5F6),
                          Colors.white
                        ]
                      )
                    ),
                    dotData: const FlDotData(show: false),
                    spots: const [
                      FlSpot(0, 1),
                      FlSpot(1, 4),
                      FlSpot(2, 3),
                      FlSpot(3, 2),
                      FlSpot(4, 3),
                      FlSpot(5, 2),
                      FlSpot(6, 5),
                    ],
                    isCurved: true,
                    color: const Color(0xff1976D2),
                    barWidth: 2,
                    isStrokeCapRound: true,
                  )
                ]
              )
            ),
          ),
        )
      ],
    );

    return Container(
      padding: const EdgeInsets.only(right: 20,top: 10,left: 10,bottom: 10),
      child: widget,
    );
  }
}