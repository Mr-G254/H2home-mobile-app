import 'package:flutter/material.dart';

class One extends StatelessWidget{
  const One({super.key});

  @override
  Widget build(BuildContext context){

    final window = Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: const Text(
            "WELCOME",
            style: TextStyle(
              fontFamily: 'Nico Moji',
              fontSize: 35
            ),
          ),
        )
      ],
    );

    return Scaffold(
      body: window,
    );
  }
}