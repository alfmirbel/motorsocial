import 'package:flutter/material.dart';

class SocialThemeData {
  final ThemeData themeData;
  final String themeId;
  final String mode;
  const SocialThemeData({required this.themeData, required this.themeId, this.mode = 'light'});
}
