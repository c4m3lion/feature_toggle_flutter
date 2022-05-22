import 'package:feature_toggle_flutter/app/styles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrightnessChangeToggle extends StatelessWidget {
  const BrightnessChangeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
