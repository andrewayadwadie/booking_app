import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/app_prefs.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(MyApp());
}
