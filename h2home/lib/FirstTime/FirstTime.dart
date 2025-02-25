import 'package:flutter/material.dart';
import 'package:h2home/FirstTime/Four.dart';
import 'package:h2home/FirstTime/One.dart';
import 'package:h2home/FirstTime/Three.dart';
import 'package:h2home/FirstTime/Two.dart';

class FirstTime extends StatefulWidget{
  const FirstTime({super.key});

  State<FirstTime> createState() => _FirstTimeState();
}

class _FirstTimeState extends State<FirstTime> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this,animationDuration: const Duration(milliseconds: 200));
    controller.addListener((){
      setState(() {
        index = controller.index;
      });

    });
  }

  @override
  Widget build(BuildContext context){
    Widget switcher = Container(
      width: MediaQuery.of(context).size.width/2,
      height: 70,
      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 15,left: 15),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Colors.white.withOpacity(0.4),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 0 ? Colors.white : Colors.transparent
                    ),
                    child: const Text(
                      "1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          fontFamily: 'IBM Plex Mono'
                      ),
                    ),
                  ),
                  onTap: () => controller.index = 0,
                ),
              ),

              Expanded(
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 1 ? Colors.white : Colors.transparent
                    ),
                    child: const Text(
                      "2",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          fontFamily: 'IBM Plex Mono'
                      ),
                    ),
                  ),
                  onTap: () => controller.index = 1,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 2 ? Colors.white : Colors.transparent
                    ),
                    child: const Text(
                      "3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          fontFamily: 'IBM Plex Mono'
                      ),
                    ),
                  ),
                  onTap: () => controller.index = 2,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 3 ? Colors.white : Colors.transparent
                    ),
                    child: const Text(
                      "4",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          fontFamily: 'IBM Plex Mono'
                      ),
                    ),
                  ),
                  onTap: () => controller.index = 3,
                ),
              ),
            ],
          ),
        )
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xff1976D2),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(0),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TabBarView(
                      controller: controller,
                      children: const [
                        One(),
                        Two(),
                        Three(),
                        Four()
                      ]
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.zero,
                  child: Visibility(
                    visible: index != 3,
                    child: switcher,
                  ),
                )
              ],
            ),
          )
        )
      )
    );
  }
}