import 'package:shared_preferences/shared_preferences.dart';

class prefsRequest{
  static Future<String?> getPrefs(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("${user}");
    return data;
  }

  static Future<void> removePrefs(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('${user}');
  }

  static Future<void> postPrefs(String user,var data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("${user}",data.toString());
  }

}