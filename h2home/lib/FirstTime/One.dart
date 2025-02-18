import 'package:flutter/material.dart';

class One extends StatelessWidget{
  const One({super.key});

  @override
  Widget build(BuildContext context){

    final window = Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 100,),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: const Text(
            "WELCOME",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Nico Moji',
              fontSize: 35
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: const Image(
              image: AssetImage("Icons/imageA.png"),
            ),
          ),
        )
      ],
    );

    return window;
  }
}