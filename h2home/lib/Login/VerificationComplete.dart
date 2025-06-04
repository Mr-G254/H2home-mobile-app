import 'package:flutter/material.dart';
import 'package:h2home/Main/Dashboard.dart';
import 'package:h2home/Main/Home.dart';

class VerificationComplete extends StatelessWidget{
  const VerificationComplete({super.key});

  @override
  Widget build(BuildContext context){
    final window = Column(
      children: [
        SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Verification complete",
              style: TextStyle(
                  fontFamily: "IBM Plex Mono",
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.white
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            "Congratulations your account has been successfully verified",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "IBM Plex Mono",
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.white
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Image(
              image: AssetImage('Icons/Check.png'),
              width: 250,
              height: 250,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 115,
          padding: const EdgeInsets.only(top: 30,bottom: 30,right: 20,left: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                backgroundColor: Colors.white
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: const Text(
              "Continue",
              style: TextStyle(
                  fontFamily: "IBM Plex Mono",
                  fontWeight: FontWeight.normal,
                  fontSize: 19,
                  color: Color(0xff1976D2)
              ),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xff1976D2),
      body: window,
    );
  }
}