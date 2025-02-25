import 'package:flutter/material.dart';
import 'package:h2home/Components/Components.dart';
import 'package:h2home/Login/SignUp.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>{
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context){
    final window = Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30,bottom: 10),
              child: const Text(
                "Login",
                style: TextStyle(
                    fontFamily: "IBM Plex Mono",
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xff1976D2)
                ),
              ),
            ),
            Input(label: "EMAIL", controller: email, inputType: TextInputType.emailAddress),
            Input(label: "PASSWORD", controller: password, inputType: TextInputType.visiblePassword),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.only(right: 20),
                child: const Text(
                  'forgot password?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontFamily: "IBM Plex Mono",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1976D2)
                  ),
                )
            ),
            Container(
              width: double.infinity,
              height: 105,
              padding: const EdgeInsets.only(top: 30,bottom: 10,right: 10,left: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: const Color(0xff1976D2)
                ),
                onPressed: () {  },
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontFamily: "IBM Plex Mono",
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: Colors.white
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10,left: 10,bottom: 5),
              child: GestureDetector(
                child: const Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff1976D2)
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(
                            fontFamily: "IBM Plex Mono",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1976D2)
                        ),
                      )
                    ]
                  )
                ),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUp()));
                },
              )
            )
          ],
        ),
      )
    );

    return Stack(
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
            body: Center(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                heightFactor: 0.5,
                child: window,
              )
            ),
          ),
        )
      ],
    );
  }
}