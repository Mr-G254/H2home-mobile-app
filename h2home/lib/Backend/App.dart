import 'dart:convert';

import 'package:h2home/Main/Profile.dart';
import 'package:http/http.dart' as http;

import 'Profile.dart';

abstract class App{
  static String token = "";
  static String username = "";
  static late Userprofile userProfile;

  static void registerUser(String email, String password1, String password2)async{
    final request = await http.post(
      Uri.parse("https://c380-41-204-187-5.ngrok-free.app/dj-rest-auth/registration/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": email.split("@")[0], "password1": password1, "password2": password2,"email":email}),
    );
    print(request.body);

    print(request.statusCode);
  }

  static Future<void> signIn(String username, String password)async{
    final request = await http.post(
        Uri.parse("https://c380-41-204-187-5.ngrok-free.app/dj-rest-auth/login/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password,}),
    );

    if(request.statusCode == 200){
      token = jsonDecode(request.body)["key"];
      print(token);
      fetchProfile();
      await initializeApp();
    }
    print(request.body);
    print(request.statusCode);

  }

  static void fetchProfile()async{
    final request = await http.get(Uri.parse("https://c380-41-204-187-5.ngrok-free.app/api/profiles"));

    if(request.statusCode == 200){
      final data = jsonDecode(request.body);
      // print(data);
      userProfile = Userprofile(username: data["name"].toString(), location: data["location"].toString(), contact: data["contact_number"].toString(), user: data["user"].toString());
      // print(userProfile?.username);
    }
    print(request.statusCode);
  }

  static Future<void> initializeApp()async{
    fetchProfile();
  }

}