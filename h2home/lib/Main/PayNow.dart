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
  final TextEditingController priceController = TextEditingController();
  final TextEditingController phone = TextEditingController();
  
  double selectedAmount = 0;
  double totalPrice = 0;
  double totalPriceNBottle = 0;

  bool isBottleSelected = false;

  void selectAmount(int price){
    setState(() {
      selectedAmount = double.parse(price.toString());
    });

    updatePrice();
    priceController.text = price.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    priceController.addListener((){
      String txt = priceController.text.trim();
      if(int.parse(txt) > 1000000){
        txt = "0";
        priceController.text = txt;
      }

      if(txt.isNotEmpty){
        setState(() {
          selectedAmount = double.parse(txt);
        });
      }else{
        setState(() {
          selectedAmount = 0;
        });
      }

      updatePrice();
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    priceController.dispose();
    super.dispose();
  }

  void updatePrice(){
    setState(() {
      totalPrice = selectedAmount * widget.vendor.price;
      totalPriceNBottle = totalPrice + 200;
    });
  }

  @override
  Widget build(BuildContext context){
    final window = Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.08,
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
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: FadeInImage.assetNetwork(
                            width: double.infinity,
                            height: double.infinity,
                            placeholder: "Icons/userv.png",
                            image: widget.vendor.imageUrl,
                            fit: BoxFit.fitHeight,
                          ),
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
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.25,
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
                  padding: EdgeInsets.all(7),
                  child: Label(label: "Quantity"),
                ),
                Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      Expanded(child: PriceButton(price: 5, isSelected: selectedAmount == 5, callback: selectAmount,)),
                      Expanded(child: PriceButton(price: 10, isSelected: selectedAmount == 10, callback: selectAmount,)),
                      Expanded(child: PriceButton(price: 15, isSelected: selectedAmount == 15, callback: selectAmount,)),
                      Expanded(child: PriceButton(price: 20, isSelected: selectedAmount == 20, callback: selectAmount,)),
                      Expanded(child: PriceButton(price: 25, isSelected: selectedAmount == 25, callback: selectAmount,)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      color: Colors.white,
                      shape: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2.5,color: Color(0xff1976D2)),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                            child: Text(
                              "Amount(L)",
                              style: TextStyle(
                                fontFamily: "IBM Plex Mono",
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.only(top: 10,bottom: 10,right: 0),
                              child: const VerticalDivider(
                                thickness: 2.5,
                                color: Color(0xff1976D2),
                              )
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: TextField(
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                  height: 1.2,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'IBM Plex Mono',
                                  color: Colors.black
                              ),
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.22,
          padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            elevation: 15,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  child: Label(label: "Pricing")
                ),
                Container(
                  padding: EdgeInsets.only(left: 15,bottom: 10),
                  child: Text.rich(
                    TextSpan(
                      text: '${selectedAmount}L water - ',
                      style: const TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'KES $totalPrice',
                          style: const TextStyle(
                            fontFamily: "IBM Plex Mono",
                            fontSize: 18,
                            color: Color(0xff1976D2),
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ]
                    )
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.only(right: 5,left: 10),
                      child: Checkbox(
                        checkColor: Colors.white,
                        activeColor: const Color(0xff1976D2),
                        value: isBottleSelected,
                        onChanged: (val){
                          setState(() {
                            isBottleSelected = val!;
                          });
                        }
                      ),
                    ),
                    const Text.rich(
                      TextSpan(
                        text: 'Include bottle - ',
                        style: const TextStyle(
                          fontFamily: "IBM Plex Mono",
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: '+ KES 200',
                            style: TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 18,
                              color: Color(0xff1976D2),
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ]
                      )
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 15,top: 10),
                  child: Text.rich(
                    TextSpan(
                      text: 'TOTAL  ',
                      style: const TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontSize: 19,
                        color: Color(0xff1976D2),
                        fontWeight: FontWeight.bold
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'KES ${isBottleSelected ? totalPriceNBottle : totalPrice}',
                          style: const TextStyle(
                            fontFamily: "IBM Plex Mono",
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ]
                    )
                  ),
                ),
                SizedBox(height: 10,)
              ],
            )
          )
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.25,
          padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            elevation: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  child: Label(label: "Payment")
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: RadioListTile(
                    activeColor: const Color(0xff1976D2),
                    visualDensity: VisualDensity(vertical: -2),
                    title: Container(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Mpesa",
                        style: TextStyle(
                            fontFamily: "IBM Plex Mono",
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    value: 1,
                    groupValue: 1,
                    onChanged: (val){

                    }
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter your phone number",
                          style: TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 15,
                              color: Color(0xff64B5F6),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 2,),
                        Expanded(
                          child: TextField(
                            controller: phone,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                height: 1.2,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'IBM Plex Mono',
                                color: Colors.black
                            ),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 2.5,color: Color(0xff1976D2)),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 2.5,color: Color(0xff1976D2)),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 0,left: 0),
                  child: RadioListTile(
                    visualDensity: const VisualDensity(vertical: -2),
                    activeColor: const Color(0xff1976D2),
                    title: Container(
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "Bank",
                        style: TextStyle(
                            fontFamily: "IBM Plex Mono",
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    value: 2,
                    groupValue: 1,
                    onChanged: (val){

                    }
                  ),
                )
              ],
            )
          )
        ),
        Container(
          padding: EdgeInsets.only(right: 15,left: 15,top: 5,bottom: 5),
          height: 60,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1976D2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),
            onPressed: (){

            },
            child: Container(
              padding: const EdgeInsets.all(0),
              child: const Text(
                "Pay",
                style: TextStyle(
                    fontFamily: "IBM Plex Mono",
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: window,
      ),
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
        actions: [
          Container(
            // width: 40,
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              child: AspectRatio(
                aspectRatio: 1,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  color: Color(0xff1976D2),
                  child: Container(
                    margin: EdgeInsets.all(2),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                  )
                ),
              ),
              onTap: (){
                Navigator.pop(context);
              },
            )
          )
        ],
      ),
    );
  }
}