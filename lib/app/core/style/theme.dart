import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData theme(context) => ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.secondary,
        primarySwatch: AppColors.createMaterialColor(AppColors.primary),
        backgroundColor: Colors.white,
      ),
    ).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.defaultTextColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.secondary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.secondary,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primary),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
