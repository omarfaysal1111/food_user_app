import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_user_app/app.dart';
import 'package:food_user_app/core/di/injection_container.dart' as di;
import 'package:food_user_app/core/localization/locale_controller.dart';
import 'package:food_user_app/core/theme/theme_controller.dart';
import 'package:food_user_app/features/profile/domain/repositories/saved_addresses_repository.dart';
import 'package:food_user_app/features/profile/presentation/controllers/saved_addresses_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  await di.init(prefs: prefs);
  final localeController = LocaleController(prefs);
  localeController.hydrate();
  final themeController = ThemeController(prefs);
  themeController.hydrate();
  final savedAddressesController = SavedAddressesController(
    repository: di.sl<SavedAddressesRepository>(),
  );
  runApp(
    App(
      localeController: localeController,
      themeController: themeController,
      savedAddressesController: savedAddressesController,
    ),
  );
}
