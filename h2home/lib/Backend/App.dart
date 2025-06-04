import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:h2home/Backend/Vendor.dart';
import 'package:h2home/Components/Components.dart';
import 'package:h2home/Main/Profile.dart';
import 'package:http/http.dart' as http;
import 'Profile.dart';

abstract class App{
  static String token = "";
  static String username = "";
  static String serverUrl = "https://0c62-197-232-162-225.ngrok-free.app";
  static late Userprofile userProfile;
  
  static List<Vendor> allvendors = [];
  static ValueNotifier<List<VendorWidget>> allvendorsWidgets = ValueNotifier([]);

  static ValueNotifier<String> waterValue = ValueNotifier("0");

  static Future<void> registerUser(String email, String password1, String password2)async{
    late http.Response request;
    username = email.split("@")[0];

    try{
      request = await http.post(
        Uri.parse("$serverUrl/dj-rest-auth/registration/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password1": password1, "password2": password2,"email":email}),
      );
      print(request.body);
      print(request.statusCode);

    }catch(e){
      throw Exception(request.body.toString().split(":")[1]);
    }

    initializeApp();
  }

  static Future<void> signIn(String Username, String password)async{
    username = Username.split("@")[0];
    try{
      final request = await http.post(
        Uri.parse("$serverUrl/dj-rest-auth/login/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password": password,}),
      );

      token = jsonDecode(request.body)["key"];

      print(request.body);
      print(request.statusCode);

    }catch(e){
      throw Exception("Ensure you have used the correct email and password");
    }

    initializeApp();
  }

  static Future<void> fetchProfile()async{
    try{
      final request = await http.get(Uri.parse("$serverUrl/users/user/profile/$username/"));

      if(request.statusCode == 200){
        final data = jsonDecode(request.body);
        // print(data);
        userProfile = Userprofile(username: data["name"].toString(), location: data["location"].toString(), contact: data["contact_number"].toString(), user: data["user"].toString());
        // print(userProfile?.username);
      }
      print(request.statusCode);
      print(request.body);

    }catch(e){
      throw Exception("Unable to fetch user profile");
    }
  }

  static Future<void> fetchVendors()async{

    try{
      final request = await http.get(Uri.parse("$serverUrl/vendors/"));

      final data = jsonDecode(request.body);

      for(final i in data){
        var vendor = Vendor(name: i["business_name"], description: i["description"], imageUrl: serverUrl + i["image"], price: double.parse(i["price_per_litre"].toString()), location: i["location"], id: i["id"]);
        allvendors.add(vendor);
        allvendorsWidgets.value.add(VendorWidget(vendor: vendor));
      }

    }catch(e){
      throw Exception(e);
    }

  }

  static Future<String> fetchWaterData()async{
    final request = await http.get(Uri.parse("$serverUrl/device/sensordata/user/$username/"));

    final data = jsonDecode(request.body);
    String value = data[0]["value"].toString();

    return value;
  }

  static Future<void> initializeApp()async{
    await fetchProfile();
    waterValue.value = await fetchWaterData();
    await fetchVendors();
  }

  static Future<void> userClicks(String vendorId) async {
    await http.post(
      Uri.parse("$serverUrl/vendor/$vendorId/visit/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"visit_count": 1}),
    );
  }

}