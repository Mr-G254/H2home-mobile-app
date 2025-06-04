import 'package:email_validator/email_validator.dart';
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
  final email = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  bool showPassword = false;
  String errorMsg = "";
  bool showError = false;
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
    "Sign up",
    style: TextStyle(
        fontFamily: "IBM Plex Mono",
        fontWeight: FontWeight.normal,
        fontSize: 19,
        color: Colors.white
    ),
  );

  void displayError(String error){
    setState(() {
      errorMsg = error;
      showError = true;
    });
  }

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
                    Container(
                      padding: const EdgeInsets.all(0),
                      child: Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: showError,
                        child: Text(
                          errorMsg,
                          style: const TextStyle(
                            fontFamily: "IBM Plex Mono",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.red
                          ),
                        ),
                      ),
                    ),
                    Input(label: 'Email', controller: email, inputType: TextInputType.emailAddress),
                    Input(label: 'Password', controller: password, inputType: TextInputType.visiblePassword,showPassword: showPassword,),
                    Input(label: 'Confirm password', controller: password2, inputType: TextInputType.visiblePassword,showPassword: showPassword,),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.only(right: 0,left: 15),
                          child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: const Color(0xff1976D2),
                            value: showPassword,
                            onChanged: (val){
                              setState(() {
                                showPassword = val!;
                              });
                            }
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Show password?",
                            style: TextStyle(
                                fontFamily: "IBM Plex Mono",
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff1976D2)
                            ),
                          )
                        )
                      ]
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
                          if(email.text.isNotEmpty && password.text.isNotEmpty && password2.text.isNotEmpty){
                            if(!EmailValidator.validate(email.text)){
                              displayError("Enter a valid email address");
                            }else{
                              if(password.text != password2.text){
                                displayError("The passwords don't match");

                              }else{
                                setState(() {
                                  isLoading = true;
                                });

                                try{
                                  await App.registerUser(email.text,password.text, password.text);
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Verification()));

                                }catch(e){
                                  setState(() {
                                    isLoading = false;
                                  });

                                  Error(e.toString());
                                }

                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const Verification()));
                              }
                            }
                          }else{
                            displayError("Ensure that all fields are filled");
                          }
                        },
                        child: isLoading ? loadingWidget : textWidget
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
                  heightFactor: 0.8,
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