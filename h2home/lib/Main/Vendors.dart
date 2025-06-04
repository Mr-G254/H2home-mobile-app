import 'package:flutter/material.dart';
import 'package:h2home/Backend/Vendor.dart';
import 'package:h2home/Components/Components.dart';

import '../Backend/App.dart';

class Vendors extends StatefulWidget{
  final List<VendorWidget> vendorWidgets;
  const Vendors({super.key,required this.vendorWidgets});

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors>{

  @override
  Widget build(BuildContext context){

    final window = Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          height: 65,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    style: const TextStyle(
                      height: 1,
                      fontSize: 15,
                      fontFamily: "IBM Plex Mono",
                      color: Colors.black
                    ),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xff1976D2),width: 3)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xff1976D2),width: 3)
                      )
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Card(
                        color: const Color(0xff1976D2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                    ),
                  )
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(right: 5,left: 5,bottom: 5),
            child: GridView.extent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 5/4,
              children: widget.vendorWidgets,
            )
          )
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: window,
      appBar: AppBar(
        leadingWidth: 0,
        leading: const SizedBox(),
        backgroundColor: Colors.white,
        title: const Text(
          "Vendors",
          style: TextStyle(
              fontFamily: "IBM Plex Mono",
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}