import 'package:flutter/material.dart';
import 'package:h2home/Main/Dashboard.dart';
import 'package:h2home/Main/Profile.dart';

class Home extends StatefulWidget{

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  int selectedIndex = 0;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener((){
      setState(() {
        selectedIndex = controller.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context){

    final bottomNav = Container(
      padding: const EdgeInsets.only(top: 10,bottom: 20),
      decoration: const BoxDecoration(
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
              controller.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
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
              controller.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
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
              controller.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
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
              controller.animateToPage(3, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
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
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            Dashboard(),
            SizedBox(),
            SizedBox(),
            Profile()
          ],
        ),
      ),
      bottomNavigationBar: bottomNav,
    );
  }
}