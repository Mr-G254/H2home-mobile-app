import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h2home/Components/Components.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home>{
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.white,
        systemStatusBarContrastEnforced: true
      ),
    );
  }

  @override
  Widget build(BuildContext context){

    final window = Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text.rich(
                TextSpan(
                  text: "Hi, ",
                  style: TextStyle(
                    fontFamily: 'IBM Plex Mono',
                    fontSize: 20
                  ),
                  children: [
                    TextSpan(
                      text: "Vanessuh!",
                      style: TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1976D2)
                      )
                    )
                  ]
                )
              ),
              Container(
                height: 45,
                width: 45,
                child: GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                    color: Color(0xff1976D2),
                    elevation: 5,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(0),
                        child: Image(
                          image: AssetImage("Icons/bell.png"),
                          height: 28,
                          width: 28,
                        ),
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: DashboardChart()
        ),
        Expanded(
          flex: 4,
          child: SizedBox(),
        ),
        Expanded(
          flex: 1,
          child: SizedBox()
        )
      ],
    );

    final bottomNav = Container(
      padding: const EdgeInsets.only(top: 10,bottom: 20),
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
        color: Color(0xff1976D2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Image(
                image: AssetImage(selectedIndex == 0 ? "Icons/dashboardB.png" : "Icons/dashboardA.png"),
                height: 28,
                width: 28,
              ),
            ),
            onTap: (){
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Image(
                image: AssetImage(selectedIndex == 1 ? "Icons/basketB.png" : "Icons/basketA.png"),
                height: 28,
                width: 28,
              ),
            ),
            onTap: (){
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Image(
                image: AssetImage(selectedIndex == 2 ? "Icons/chartB.png" : "Icons/chartA.png"),
                height: 28,
                width: 28,
              ),
            ),
            onTap: (){
              setState(() {
                selectedIndex = 2;
              });
            },
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Image(
                image: AssetImage(selectedIndex == 3 ? "Icons/userB.png" : "Icons/userA.png"),
                height: 28,
                width: 28,
              ),
            ),
            onTap: (){
              setState(() {
                selectedIndex = 3;
              });
            },
          ),
        ],
      )
    );


    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(child: window),
      ),
      bottomNavigationBar: bottomNav
    );
  }
}