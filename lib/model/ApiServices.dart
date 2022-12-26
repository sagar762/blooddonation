import 'dart:convert';
import 'dart:io';

import 'package:blooddonation/HomeScreens/HomePage.dart';
import 'package:blooddonation/model/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:blooddonation/model/Usermodel.dart';

import 'ApiConfig.dart';

class ApiServices {
  final loginurl = "/login";
  final signupurl = "/register";
  ProductModeL _user = ProductModeL();

  void login(BuildContext context, {String? email, String? password}) async {
    try {
      // print("called");
      var response = await http.post(
        Uri.parse(ApiConfig.baseUrl + loginurl),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode({"email": email, "password": password }),
      );
      // print(response.body);
      if (response.statusCode == 200) {
        await SharedData.setEmail(email);
        // await SharedData.setName(name);
        // await SharedData.setName(name);
        var data = response.body;
        var responsees = jsonDecode(data);
        _user = ProductModeL.fromJson(responsees);
        // var location = responsees['user']['location'];
        final prefs = await SharedPreferences.getInstance();
        // prefs.setString('location', location);
        var phone_number = responsees['user']['phone_number'];
        var name = _user.user?.name.toString();
        prefs.setString('name', name!);
        print(name);
        // prefs.setString('phone_number', phone_number);
        // print(location);

        // print(Text(responsees['user']['name']));
        final users = Uri.dataFromString(data);
        String token = responsees['access_token'];
        // String name = responsees[[]'];
        //  print(_user.user?.email);
        // var location = SharedData.getLocation();

        print(token);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content:Text('eadf'),
          ),
        );
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const HomePage()),
                (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
                "The email or password you entered is incorrect. Please try again"),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
  // void fetchUsers() async{
  //   try{
  //     var response = await http.post(
  //       Uri.parse(ApiConfig.baseUrl + loginurl),
  //       headers: {HttpHeaders.contentTypeHeader: "application/json"},
  //       body: jsonEncode({}),
  //     );
  //     if (response.statusCode == 200) {
  //       // await SharedData.setEmail(email);
  //       // await SharedData.setName(name);
  //       var data = response.body;
  //       var responsees = jsonDecode(data);
  //
  //       var location = responsees['user']['location'];
  //       final prefs = await SharedPreferences.getInstance();
  //       prefs.setString('location', location);
  //       print(location);
  //
  //       // print(Text(responsees['user']['name']));
  //       final users = Uri.dataFromString(data);
  //       String token = responsees['access_token'];
  //       // String name = responsees[[]'];
  //       // print(name);
  //       // var location = SharedData.getLocation();
  //
  //       print(token);
  //
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

//register
}

