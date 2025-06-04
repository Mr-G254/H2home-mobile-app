import 'package:fancy_password_field/fancy_password_field.dart';
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
  bool isLoading = false;

  final loadingWidget = Container(
    padding: const EdgeInsets.all(5),
    child: const CircularProgressIndicator(
      color: Colors.white,
      strokeCap: StrokeCap.round,
      strokeWidth: 5,
    ),
  );

  final textWidget = const Text(
    "Login",
    style: TextStyle(
      fontFamily: "IBM Plex Mono",
      fontWeight: FontWeight.normal,
      fontSize: 19,
      color: Colors.white
    ),
  );

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
                    child: FancyPasswordField(
                      controller: password,
                      hasStrengthIndicator: false,
                      hasValidationRules: false,
                      keyboardType: TextInputType.visiblePassword,
                      showPasswordWidget: Container(
                        padding: EdgeInsets.all(2),
                        child: const Image(
                          image: AssetImage("Icons/hide.png"),
                          color: Color(0xff1976D2),
                          height: 27,
                          width: 27,
                        ),
                      ),
                      hidePasswordWidget: const Image(
                        image: AssetImage("Icons/show.png"),
                        color: Color(0xff1976D2),
                        height: 27,
                        width: 25,
                      ),
                      style: const TextStyle(
                        height: 1.4,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IBM Plex Mono',
                        color: Color(0xff64B5F6)
                      ),
                      cursorColor: const Color(0xff64B5F6),
                      decoration: InputDecoration(
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
                    ),
                  ),
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
                  setState(() {
                    isLoading = true;
                  });

                  try{
                    await App.signIn(email.text, password.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));

                  }catch(e){
                    setState(() {
                      isLoading = false;
                    });
                    Error(e.toString());
                  }
                },
                child: isLoading ? loadingWidget : textWidget,
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