import 'package:flutter/material.dart';

/// Optional appearance overrides; omitted values follow the surrounding theme.
@immutable
final class IconDialogThemeData {
  const IconDialogThemeData({
    this.iconColor,
    this.iconSize = 36,
    this.titleStyle,
    this.contentStyle,
    this.buttonColor,
    this.buttonTextColor,
    this.backgroundColor,
  }) : assert(iconSize > 0 && iconSize < double.infinity);

  final Color? iconColor;
  final double iconSize;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Color? backgroundColor;
}
