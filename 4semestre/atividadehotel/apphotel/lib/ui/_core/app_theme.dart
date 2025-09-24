import 'package:apphotel/ui/_core/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  // cria variavel para armazenar o tema do app
  static ThemeData appTheme = ThemeData.light().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColors.darkText),
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey.shade400;
          } else if (states.contains(WidgetState.pressed)) {
            return AppColors.mainColor.withOpacity(0.7);
          }
          return AppColors.mainColor;
        }),
      ),
    ),
  );
}
      