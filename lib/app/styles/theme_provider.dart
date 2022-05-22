import 'package:feature_toggle_flutter/app/services/storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  ThemeProvider() {
    StorageManager.readData('isDarkThemeData').then((value) {
      var themeMode = value ?? false;
      toggleTheme(themeMode);
    });
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    StorageManager.saveData('isDarkThemeData', isOn);
    notifyListeners();
  }
}

class MyThemeData {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 100,
      titleTextStyle: TextStyle(
        fontSize: 50,
      ),
      elevation: 2,
    ),
  );

  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: 100,
      titleTextStyle: TextStyle(
        fontSize: 50,
        color: Colors.black,
      ),
      toolbarTextStyle: TextStyle(fontSize: 20),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 2,
    ),
    primarySwatch: Colors.blue,
  );
}
