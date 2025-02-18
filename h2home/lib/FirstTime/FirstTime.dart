import 'package:flutter/material.dart';

class Firsttime extends StatefulWidget{
  const Firsttime({super.key});

  State<Firsttime> createState() => _FirsttimeState();
}

class _FirsttimeState extends State<Firsttime>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.zero,
              child: TabBarView(
                children: [
                  
                ]
              ),
            )
          ],
        )
      ),
    );
  }
}