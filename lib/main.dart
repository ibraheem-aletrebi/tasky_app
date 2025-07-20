import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/routing/router_generator.dart';
import 'package:tasky/core/services/preference_manegar/preference_manegar.dart';
import 'package:tasky/core/theme/dark_theme.dart';
import 'package:tasky/core/theme/light_theme.dart';
import 'package:tasky/core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding();
  await PreferenceManegar().init();
  // PreferenceManegar().clear();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()..init()),
        ChangeNotifierProvider(create: (_) => TasksController()..init()),
      ],
      child: Consumer<ThemeController>(
        builder: (context, themeController, _) {
          return MaterialApp.router(
            routerConfig: RouterGenerator().routes,
            debugShowCheckedModeBanner: false,
            themeMode: themeController.themeMode,
            theme: lightTheme,
            darkTheme: darktheme,
          );
        },
      ),
    );
  }
}
