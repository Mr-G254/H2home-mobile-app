import 'package:flutter/material.dart';
import 'package:h2home/FirstTime/FirstTime.dart';

class Splashscreen extends StatefulWidget{
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FirstTime()));
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Icons/Splash.jpg'),
            fit: BoxFit.fill
          ),
        ),
      ),
    );
  }
}