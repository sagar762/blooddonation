import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static SharedPreferences? prefs;

  static getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

//email
  static Future setEmail(var email) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.setString("email", email);
  }

  static String getEmail() => prefs?.getString("email") ?? '';

  //phone
  static Future setPhone(var phone_number) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.setString("phone_number", phone_number);
  }

  static String getPhone() => prefs?.getString("phone_number") ?? '';

  //name

  //phone
  static Future setName(var name) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.setString("name", name);
  }

  static String getName() => prefs?.getString("name") ?? '';

  static Future setToken(var access_token) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.setString('access_token', access_token);
  }

  static String getToken() => prefs?.getString('access_token') ?? '';

  static Future setLocation(var location) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.setString('location', location);
  }

  static String getLocation() => prefs?.getString('location') ?? '';
}
