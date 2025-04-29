import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:h2home/Backend/Vendor.dart';
import 'package:h2home/Main/PayNow.dart';
import 'package:toastification/toastification.dart';

class Input extends StatelessWidget{
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  bool showPassword;
  Input({super.key,required this.label,required this.controller,required this.inputType,this.showPassword = true});

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
            obscureText: showPassword? false : true,
            enableSuggestions: showPassword? false : false,
            autocorrect: false,
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
        const Label(label: "Week"),
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

class Label extends StatelessWidget{
  final String label;
  const Label({super.key,required this.label});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 2,bottom: 2,right: 10,left: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Color(0xff1976D2)
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: "IBM Plex Mono",
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
    );
  }
}

class WaterComponents extends StatelessWidget{
  final String component;
  const WaterComponents({super.key,required this.component});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffF88D0A),
      ),
      child: Text(
        component,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontFamily: "IBM Plex Mono",
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
    );
  }
}

class VendorWidget extends StatelessWidget{
  final Vendor vendor;
  const VendorWidget({super.key,required this.vendor});

  @override
  Widget build(BuildContext context){
    final card =  Container(
      padding: const EdgeInsets.all(0),
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              // color: Colors.orange,
              child: const Image(
                image: AssetImage("Icons/userpic.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: const Color(0xff64B5F6),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8)
                          )
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          vendor.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
            Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.topLeft,
              child: Card(
                color: Colors.black.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "KES ${vendor.price}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                )
              )
            )
          ],
        ),
      ),
    );

    return GestureDetector(
      child: card,
      onTap: (){
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          elevation: 10,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
          ),
          builder: (context) => VendorBottomSheet(vendor: vendor,)
        );
      },
    );
  }
}

class VendorBottomSheet extends StatelessWidget{
  final Vendor vendor;
  const VendorBottomSheet({super.key,required this.vendor});

  @override
  Widget build(BuildContext context){
    final bottomSheet =  Column( mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15,top: 5),
              child: Text(
                vendor.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "IBM Plex Mono",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
            Container(
              width: 60,
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                child: const AspectRatio(
                  aspectRatio: 1,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
                    color: Color(0xff1976D2),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              )
            )
          ],
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 0,right: 15,left: 15,bottom: 0),
          child: AspectRatio(
            aspectRatio: 5/3,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image(
                image: AssetImage(vendor.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          )
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: const Text(
                    "Description",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5,top: 5,right: 5),
                  child: Text(
                    vendor.description,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: const Text(
                  "Price per Litre",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "IBM Plex Mono",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5,top: 5,right: 55),
                child: Text(
                  "KES ${vendor.price}",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontFamily: "IBM Plex Mono",
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1976D2)
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 65,
          padding: EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1976D2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PayNow(vendor: vendor)));
            },
            child: const Text(
              "Order now",
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontFamily: "IBM Plex Mono",
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );

    return Container(
      height: MediaQuery.of(context).size.height*0.65,
      child: bottomSheet,
    );
  }
}

class PriceButton extends StatelessWidget{
  final int price;
  final bool isSelected;
  final void Function(int) callback;
  const PriceButton({super.key,required this.price,required this.isSelected,required this.callback});

  @override
  Widget build(BuildContext context){
    final button = Container(
      padding: const EdgeInsets.all(2),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          color: isSelected ? const Color(0xff1976D2) : Colors.white,
          shape: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xff1976D2),
            ),
            borderRadius: BorderRadius.circular(6)
          ),
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                "${price.toString()}L",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "IBM Plex Mono",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: isSelected? Colors.white : const Color(0xff1976D2)
                ),
              ),
            ),
          )
        ),
      ),
    );

    return GestureDetector(
      child: button,
      onTap: (){
        callback(price);
      },
    );
  }
}

void Error(String message){
  toastification.show(
    type: ToastificationType.error,
    style: ToastificationStyle.flat,
    title: const Text(
      'An error occurred',
      style: TextStyle(
        fontFamily: "IBM Plex Mono",
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Colors.black
      ),
    ),
    foregroundColor: Colors.red,
    showProgressBar: true,
    description: Text(
      message,
      style: const TextStyle(
        fontFamily: "IBM Plex Mono",
        fontWeight: FontWeight.normal,
        fontSize: 10,
        color: Colors.black
      ),
    ),
    autoCloseDuration: const Duration(seconds: 5)
  );
}