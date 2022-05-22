import 'package:feature_toggle_flutter/app/modules/overview.dart';
import 'package:feature_toggle_flutter/app/styles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            darkTheme: MyThemeData.darkTheme,
            theme: MyThemeData.lightTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: '/home',
            routes: {
              '/home': (context) => Overview(),
            },
          );
        });
  }
}
