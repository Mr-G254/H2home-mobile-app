import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class App{
  static String token = "";
  static String username = "";

  static void registerUser(String email, String username, String password)async{
    final request = await http.post(
      Uri.parse("https://52c8-41-204-187-5.ngrok-free.app/dj-rest-auth/registration/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password1": password, "password2": password,"email":email}),
    );

    print(request.statusCode);
  }

  static void signIn(String username, String password)async{
    final request = await http.post(
      Uri.parse("https://52c8-41-204-187-5.ngrok-free.app/dj-rest-auth/login/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password,}),
    );

    if(request.statusCode == 200){
      token = jsonDecode(request.body)["key"];
    }
    print(request.statusCode);

  }

}