import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_user_app/app.dart';
import 'package:food_user_app/core/di/injection_container.dart' as di;
import 'package:food_user_app/core/localization/locale_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await di.init();
  final localeController = LocaleController(prefs);
  localeController.hydrate();
  runApp(App(localeController: localeController));
}
