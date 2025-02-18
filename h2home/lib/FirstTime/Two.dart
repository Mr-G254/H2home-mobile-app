import 'package:flutter/material.dart';

class Two extends StatelessWidget{
  const Two({super.key});

  @override
  Widget build(BuildContext context){

    final window = Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Text(
              "Fresh and clean water",
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
              image: AssetImage("Icons/imageB.png"),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Text(
            "Get fresh water at your convenience",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'IBM Plex Mono',
              fontSize: 17,
              fontWeight: FontWeight.normal
              ),
            ),
          )
        ),
      ],
    );

    return window;
  }
}