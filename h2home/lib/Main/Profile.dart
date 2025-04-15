import 'package:flutter/material.dart';
import 'package:h2home/Backend/App.dart';

class Profile extends StatelessWidget{
  const Profile({super.key});

  @override
  Widget build(BuildContext context){
    final window = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: AspectRatio(
              aspectRatio: 1,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                color: const Color(0xff64B5F6),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Image(
                    image: AssetImage("Icons/hacker.png"),
                    fit: BoxFit.cover,
                  ),
                )
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 10,left: 10,bottom: 10),
          child: Text(
            App.userProfile.username,
            style: const TextStyle(
                fontFamily: "IBM Plex Mono",
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          padding: const EdgeInsets.only(right: 20,left: 35),
          child: Column(
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage("Icons/email.png"),
                    height: 30,
                    width: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EMAIL",
                          style: TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 16,
                              color: Color(0xff64B5F6),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "vanessatrizzah@gmail.com",
                          style: TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  const Image(
                    image: AssetImage("Icons/phone.png"),
                    height: 30,
                    width: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "PHONE",
                          style: TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 16,
                              color: Color(0xff64B5F6),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          App.userProfile.contact.toString(),
                          style: const TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  const Image(
                    image: AssetImage("Icons/location.png"),
                    height: 30,
                    width: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ADDRESS",
                          style: TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 16,
                              color: Color(0xff64B5F6),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          App.userProfile.location,
                          style: const TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  const Image(
                    image: AssetImage("Icons/calendar.png"),
                    height: 30,
                    width: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DATE JOINED",
                          style: TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 16,
                              color: Color(0xff64B5F6),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "12 Nov 2003",
                          style: TextStyle(
                              fontFamily: "IBM Plex Mono",
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 35,),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 70,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color(0xff1976D2),width: 3)
              )
            ),
            onPressed: (){

            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage("Icons/edit.png"),
                  height: 20,
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15,bottom: 15,right: 10,left: 10),
                  child: const Text(
                    "Edit details",
                    style: TextStyle(
                        fontFamily: "IBM Plex Mono",
                        fontSize: 17,
                        color: Color(0xff64B5F6),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ),
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
          "Profile",
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