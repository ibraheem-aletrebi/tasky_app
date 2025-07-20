import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/layaout/layout_screen.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/Feature/welcome/welcome_screen.dart';
import 'package:tasky/core/services/preference_manegar/preference_manegar.dart';
import 'package:tasky/core/services/preference_manegar/storage_key.dart';
import 'package:tasky/core/theme/dark_theme.dart';
import 'package:tasky/core/theme/light_theme.dart';
import 'package:tasky/core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding();
  await PreferenceManegar().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeController()..init(),

      child: Consumer<ThemeController>(
        builder: (context, value, child) => ChangeNotifierProvider(
          create: (context) => TasksController()..init(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: value.themeMode,
            theme: lightTheme,
            darkTheme: darktheme,
            home: (PreferenceManegar().getString(StorageKey.userName) == null)
                ? WelcomeScreen()
                : LayoutScreen(),
          ),
        ),
      ),
    );
  }
}
