import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  Widget build(BuildContext context){

    final bottomNav = Container(
      padding: const EdgeInsets.only(top: 15,bottom: 20),
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
                height: 30,
                width: 30,
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
                height: 30,
                width: 30,
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
                height: 30,
                width: 30,
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
                height: 30,
                width: 30,
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
        // color: Colors.white,
      ),
      bottomNavigationBar: bottomNav
    );
  }
}