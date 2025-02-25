import 'package:flutter/material.dart';
import 'package:h2home/Login/Login.dart';

class Four extends StatelessWidget{
  const Four({super.key});

  @override
  Widget build(BuildContext context){

    final window = Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Text(
              "Track your consumption",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'IBM Plex Mono',
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Image(
              image: AssetImage("Icons/imageD.png"),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Text(
              "Monitor your water intake at your convenience",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'IBM Plex Mono',
                  fontSize: 17,
                  fontWeight: FontWeight.normal
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 65,
          padding: const EdgeInsets.only(top: 5,bottom: 5,right: 20,left: 20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  backgroundColor: Colors.white
              ),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontFamily: "IBM Plex Mono",
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    color: Color(0xff1976D2)
                  ),
                ),
              )
          ),
        ),
      ],
    );

    return window;
  }
}