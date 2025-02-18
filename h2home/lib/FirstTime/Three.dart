import 'package:flutter/material.dart';

class Three extends StatelessWidget{
  const Three({super.key});

  @override
  Widget build(BuildContext context){

    final window = Column(
      children: [
        Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: const Text(
                "We promise fast delivery",
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
              image: AssetImage("Icons/imageC.png"),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Text(
              "Fast and assured delivery anytime, anywhere",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'IBM Plex Mono',
                fontSize: 17,
                fontWeight: FontWeight.normal
              ),
            ),
          ),
        )
      ],
    );

    return window;
  }
}