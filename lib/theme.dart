
import 'package:flutter/material.dart';

class ThemeClass { 
 static ThemeData buildTheme(ColorScheme colorScheme) {
      return ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme.copyWith(surface: colorScheme.surface),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: colorScheme.onSurface.withOpacity(0.2),
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 4,
        ),
      );
}
}