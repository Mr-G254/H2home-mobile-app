import 'package:flutter/material.dart';
import 'package:h2home/Components/Components.dart';
import 'package:h2home/Login/VerificationComplete.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Verification extends StatefulWidget{
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VerificationComplete()));
    });
  }

  @override
  Widget build(BuildContext context){
    final window = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 30),
            child: const Text(
              "H2-Home",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Nico Moji',
                  color: Colors.white
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.zero,
          child: Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30,bottom: 10),
                  child: const Text(
                    "Verification",
                    style: TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        color: Color(0xff1976D2)
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10,bottom: 20,right: 20,left: 20),
                  child: const Text(
                    "An email has been sent to vanessatrizzah@gmail.com. Click on the link to verify",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xff64B5F6)
                    ),
                  ),
                ),
                SizedBox(height: 70,),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: const Color(0xff1976D2),
                    size: 40
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );

    return Container(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Icons/bg.png'),
                    fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0),
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: FractionallySizedBox(
                      heightFactor: 0.6,
                      widthFactor: 0.9,
                      child: window,
                    ),
                  )
              ),
            )
          ],
        )
    );
  }
}