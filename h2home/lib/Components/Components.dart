import 'package:flutter/material.dart';

class Input extends StatelessWidget{
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  const Input({super.key,required this.label,required this.controller,required this.inputType});

  @override
  Widget build(BuildContext context){
    final input = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(0),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'IBM Plex Mono',
              color: Color(0xff1976D2)
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            textInputAction: TextInputAction.next,
            cursorColor: const Color(0xff64B5F6),
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'IBM Plex Mono',
                color: Color(0xff64B5F6)
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff1976D2),
                  width: 4
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff1976D2),
                  width: 4
                )
              ),
            ),
          ),
        )
      ],
    );

    return Container(
      padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
      child: input,
    );
  }
}