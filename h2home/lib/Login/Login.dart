import 'package:flutter/material.dart';
import 'package:h2home/Components/Components.dart';
import 'package:h2home/Login/ForgotPassword.dart';
import 'package:h2home/Login/SignUp.dart';
import 'package:h2home/Main/Dashboard.dart';
import 'package:h2home/Main/Home.dart';
import 'package:passwordfield/passwordfield.dart';

import '../Backend/App.dart';

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
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
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
                    fontSize: 21,
                    color: Color(0xff1976D2)
                ),
              ),
            ),
            Input(label: "EMAIL", controller: email, inputType: TextInputType.emailAddress),
            // Input(label: "PASSWORD", controller: password, inputType: TextInputType.visiblePassword),
            Container(
              padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(0),
                    child: const Text(
                      "Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'IBM Plex Mono',
                          color: Color(0xff1976D2)
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: PasswordField(
                      controller: password,
                      backgroundColor: Colors.white,
                      hintText: "",
                      errorMessage: "",
                      color: const Color(0xff1976D2),
                      passwordDecoration: PasswordDecoration(
                        suffixIcon: const Icon(
                          Icons.remove_red_eye_sharp,
                          color: Color(0xff1976D2),
                        ),
                        inputStyle: const TextStyle(
                          height: 1.4,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'IBM Plex Mono',
                          color: Color(0xff64B5F6)
                        ),
                      ),
                      border: PasswordBorder(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color(0xff1976D2),
                                width: 3
                            )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color(0xff1976D2),
                                width: 3
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color(0xff1976D2),
                                width: 3
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color(0xff1976D2),
                                width: 3
                            )
                        ),
                      ),
                      // cursorColor: const Color(0xff64B5F6),
                      // style: const TextStyle(
                      //     height: 1.4,
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.bold,
                      //     fontFamily: 'IBM Plex Mono',
                      //     color: Color(0xff64B5F6)
                      // ),
                      //
                    ),
                  )
                ],
              ),
            ),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  child: const Text(
                    'forgot password?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1976D2)
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword()));
                  },
                )
            ),
            Container(
              width: double.infinity,
              height: 90,
              padding: const EdgeInsets.only(top: 30,bottom: 10,right: 10,left: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: const Color(0xff1976D2)
                ),
                onPressed: () async{
                  try{
                    await App.signIn(email.text, password.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

                  }catch(e){
                    Error(e.toString());
                  }
                },
                child: const Text(
                  "Login",
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
                    text: "Don't have an account? ",
                    style: TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff1976D2)
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up",
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
                widthFactor: 0.85,
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