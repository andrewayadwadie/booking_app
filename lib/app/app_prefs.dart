import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _sharedPref;
  static const _loged = 'loged';

  static Future init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

//!------------------------------- login---------------------------- */
  static Future setLoginValue(bool value) async {
    await _sharedPref!.setBool(_loged, value);
  }

  static bool getLoginValue() {
    return _sharedPref!.getBool(_loged) ?? false;
  }

  static Future clearLogin() async {
    await _sharedPref!.remove(_loged);
  }
}
