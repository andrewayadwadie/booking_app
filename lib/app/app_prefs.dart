import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _sharedPref;
  static const _token = 'usertoken';
 

  static Future init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

//!------------------------------- Token---------------------------- */
  static Future setTokenValue(String value) async {
    await _sharedPref!.setString(_token, value);
  }

  static String getTokenValue() {
    return _sharedPref!.getString(_token) ?? '';
  }

  static Future clearToken() async {
    await _sharedPref!.remove(_token);
  }

 
  
}
