import 'package:shared_preferences/shared_preferences.dart';
class sharedprefs{
  static SharedPreferences? sharedPreferences;
  static Future init() async =>
      sharedPreferences = await SharedPreferences.getInstance();

}