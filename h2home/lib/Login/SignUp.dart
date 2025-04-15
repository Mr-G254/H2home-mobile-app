import 'package:flutter/material.dart';
import 'package:h2home/Backend/App.dart';
import 'package:h2home/Components/Components.dart';
import 'package:h2home/Login/Login.dart';
import 'package:h2home/Login/Verification.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
  final fname = TextEditingController();
  final lname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context){
    final window = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Expanded(
          child: Container(
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
                        "Sign Up",
                        style: TextStyle(
                            fontFamily: "IBM Plex Mono",
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Color(0xff1976D2)
                        ),
                      ),
                    ),
                    Input(label: 'First name', controller: fname, inputType: TextInputType.name),
                    Input(label: 'Second name', controller: lname, inputType: TextInputType.name),
                    Input(label: 'Email', controller: email, inputType: TextInputType.emailAddress),
                    Input(label: 'Password', controller: password, inputType: TextInputType.visiblePassword),
                    Container(
                      width: double.infinity,
                      height: 90,
                      padding: const EdgeInsets.only(top: 30,bottom: 10,right: 10,left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            backgroundColor: const Color(0xff1976D2)
                        ),
                        onPressed: () {
                          App.registerUser(email.text,password.text, password.text);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const Verification()));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontFamily: "IBM Plex Mono",
                            fontWeight: FontWeight.normal,
                            fontSize: 19,
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
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                      fontFamily: "IBM Plex Mono",
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff1976D2)
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Login",
                                      style: TextStyle(
                                          fontFamily: "IBM Plex Mono",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff1976D2)
                                      ),
                                    )
                                  ]
                              )
                          ),
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                          },
                        )
                    )
                  ],
                ),
              )
            ),
          )
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
                  heightFactor: 0.85,
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