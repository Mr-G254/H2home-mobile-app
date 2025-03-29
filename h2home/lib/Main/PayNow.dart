import 'package:flutter/material.dart';
import 'package:h2home/Backend/Vendor.dart';
import 'package:h2home/Components/Components.dart';

class PayNow extends StatefulWidget{
  final Vendor vendor;
  const PayNow({super.key,required this.vendor});

  @override
  State<PayNow> createState() => _PayNowState();
}

class _PayNowState extends State<PayNow>{

  @override
  Widget build(BuildContext context){
    final window = Column(
      children: [
        Expanded(
          flex: 1,
            child: Container(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: double.infinity,
                        padding: const EdgeInsets.all(0),
                        child: AspectRatio(
                          aspectRatio: 1/1,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            child: Image(
                              image: AssetImage(widget.vendor.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: const Text(
                                "Vendor",
                                style: TextStyle(
                                    fontFamily: "IBM Plex Mono",
                                    fontSize: 16,
                                    color: Color(0xff1976D2),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                widget.vendor.name,
                                style: const TextStyle(
                                    fontFamily: "IBM Plex Mono",
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "${widget.vendor.price.toString()} KES/L",
                      style: const TextStyle(
                          fontFamily: "IBM Plex Mono",
                          fontSize: 16,
                          color: Color(0xff1976D2),
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Label(label: "Quantity"),
                  )
                ],
              ),
            ),
          )
        ),
        Expanded(
            flex: 3,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 15,
              child: SizedBox(),
            )
        ),
        Expanded(
            flex: 3,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 15,
              child: SizedBox(),
            )
        ),
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
          "Order",
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