import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../gen/colors.gen.dart';

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: ColorName.screenBg,
      colorScheme: const ColorScheme.dark(
        primary: ColorName.accent,
        surface: ColorName.surface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorName.screenBg,
        elevation: 0,
        centerTitle: false,
        foregroundColor: ColorName.textPrimary,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: ColorName.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
