import 'package:flutter/material.dart';
import 'package:h2home/Components/Components.dart';

class ForgotPassword extends StatefulWidget{
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>{
  final email = TextEditingController();

  @override
  Widget build(BuildContext context){
    final window = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30,bottom: 10),
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontFamily: "IBM Plex Mono",
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          color: Color(0xff1976D2)
                      ),
                    ),
                  ),
                  Input(label: 'EMAIL', controller: email, inputType: TextInputType.emailAddress),
                  const SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 90,
                    padding: const EdgeInsets.only(top: 30,bottom: 10,right: 10,left: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          backgroundColor: const Color(0xff1976D2)
                      ),
                      onPressed: () {  },
                      child: const Text(
                        "Recover",
                        style: TextStyle(
                            fontFamily: "IBM Plex Mono",
                            fontWeight: FontWeight.normal,
                            fontSize: 19,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
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
                      widthFactor: 0.85,
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