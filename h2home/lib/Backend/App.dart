import 'dart:convert';
import 'package:h2home/Main/Profile.dart';
import 'package:http/http.dart' as http;
import 'Profile.dart';

abstract class App{
  static String token = "";
  static String username = "";
  static String serverUrl = "https://e8bf-41-204-187-5.ngrok-free.app";
  static late Userprofile userProfile;

  static Future<void> registerUser(String email, String password1, String password2)async{
    try{
      final request = await http.post(
        Uri.parse("$serverUrl/dj-rest-auth/registration/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": email.split("@")[0], "password1": password1, "password2": password2,"email":email}),
      );
      print(request.body);
      print(request.statusCode);

      if(request.statusCode != 200){
        throw Exception(request.body);
      }else{
        fetchProfile();
      }
    }catch(e){
      throw Exception("Unable to create account");
    }
  }

  static Future<void> signIn(String username, String password)async{
    try{
      final request = await http.post(
        Uri.parse("$serverUrl /dj-rest-auth/login/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username.split("@")[0], "password": password,}),
      );

      if(request.statusCode == 200){
        token = jsonDecode(request.body)["key"];
        print(token);
        await fetchProfile();
        await initializeApp();
      }else{
        throw Exception("Unable to login");
      }
      print(request.body);
      print(request.statusCode);

    }catch(e){
      throw Exception("Ensure you have used the correct email and password");
    }
  }

  static Future<void> fetchProfile()async{
    final request = await http.get(Uri.parse("https://e8bf-41-204-187-5.ngrok-free.app/api/profiles"));

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