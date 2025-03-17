import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h2home/Components/Components.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

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
    final water = Container(
      padding: const EdgeInsets.only(right: 10,left: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: LiquidLinearProgressIndicator(
              backgroundColor: Colors.white,
              value: 0.6,
              valueColor: const AlwaysStoppedAnimation(Color(0xff1976D2)),
              borderColor: const Color(0xff64B5F6),
              borderWidth: 3,
              direction: Axis.vertical,
              borderRadius: 10,
              center: const Text(
                "60%",
                style: TextStyle(
                    fontFamily: "IBM Plex Mono",
                    fontSize: 17,
                    color: Colors.white
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 8,bottom: 5),
            child:  const Text(
              "250L",
              style: TextStyle(
                fontFamily: "IBM Plex Mono",
                fontSize: 25,
                color: Color(0xff64B5F6),
                fontWeight: FontWeight.w900
              ),
            ),
          )
        ],
      )
    );

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
                    color: const Color(0xff1976D2),
                    elevation: 5,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        child: const Image(
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
        const Expanded(
          flex: 1,
          child: DashboardChart()
        ),
        const SizedBox(height: 10,),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Label(label: "Remaining water"),
                      const SizedBox(height: 10,),
                      Expanded(
                        child: water
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              color: Colors.white,
                              elevation: 15,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      child: Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: const AspectRatio(
                                              aspectRatio: 1/1,
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: CircularProgressIndicator(
                                                  strokeCap: StrokeCap.round,
                                                  strokeWidth: 10,
                                                  value: 0.8,
                                                  color: Color(0xff1976D2),
                                                ),
                                              ),
                                            )
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "80%",
                                              style: TextStyle(
                                                fontFamily: "IBM Plex Mono",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff64B5F6)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Purity",
                                      style: TextStyle(
                                          fontFamily: "IBM Plex Mono",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xff64B5F6)
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              // shadowColor: Colors.black,
                              color: Colors.white,
                              elevation: 15,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        child: const Text(
                                          "Components",
                                          style: TextStyle(
                                              fontFamily: "IBM Plex Mono",
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff64B5F6)
                                          ),
                                        ),
                                      )
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: GridView.extent(
                                        maxCrossAxisExtent: MediaQuery.of(context).size.width/3,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: 3/1,
                                        children: const [
                                          WaterComponents(component: "Magnesium"),
                                          WaterComponents(component: "Calcium"),
                                          WaterComponents(component: "Sodium"),
                                          WaterComponents(component: "Iron")
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,)
                                  ],
                                ),
                              )
                            ),
                          )
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
          )
        ),
        Expanded(
          flex: 2,
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