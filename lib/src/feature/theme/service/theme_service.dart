import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeServiceProvider = ChangeNotifierProvider<ThemeService>(((ref) {
  return ThemeService();
}));

class ThemeService extends ChangeNotifier {
  ThemeData get theme => lightTheme;

  ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
