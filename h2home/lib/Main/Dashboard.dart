import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h2home/Components/Components.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class Dashboard extends StatefulWidget{
  const Dashboard({super.key});

  State<Dashboard> createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard>{

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
                                    const SizedBox(height: 5,)
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
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(right: 10,left: 10,top: 5),
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Label(label: "Delivery"),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      color: const Color(0xff64B5F6),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: const Text(
                                                  "Ongoing",
                                                  style: TextStyle(
                                                      fontFamily: "IBM Plex Mono",
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              )
                                          ),
                                          const SizedBox(height: 5,),
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              child: LinearProgressIndicator(
                                                value: 0.8,
                                                backgroundColor: Colors.white,
                                                color: const Color(0xff1976D2),
                                                borderRadius: BorderRadius.circular(4),
                                                minHeight: 6,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                              Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      color: const Color(0xff64B5F6),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: const Text(
                                                  "Expected",
                                                  style: TextStyle(
                                                      fontFamily: "IBM Plex Mono",
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              )
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                                padding: const EdgeInsets.all(10),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets.only(right: 10,bottom: 10),
                                                      child: const Icon(
                                                        Icons.calendar_month_outlined,
                                                        size: 25,
                                                        color: Color(0xff1976D2),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets.all(0),
                                                      child: const Text(
                                                        "12/12/2025",
                                                        style: TextStyle(
                                                            fontFamily: "IBM Plex Mono",
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xff64B5F6),
                        Color(0xff1976D2)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0,0.3,0.8]
                    )
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Image(
                                      image: AssetImage("Icons/offer.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: const EdgeInsets.all(0),
                                    child: const Text(
                                      "Offer!!",
                                      style: TextStyle(
                                          fontFamily: "IBM Plex Mono",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  "Get discounts through our referral program",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "IBM Plex Mono",
                                      fontSize: 12,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: double.infinity,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Image(
                            image: AssetImage("Icons/share.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        )
      ],
    );


    return window;
  }
}