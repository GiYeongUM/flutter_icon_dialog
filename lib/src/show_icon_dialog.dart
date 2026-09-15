import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'alert_icon_type.dart';
import 'icon_dialog_theme.dart';
import 'icon_dialog_widget.dart';

/// Shows a dialog and returns the result supplied to Navigator.pop.
Future<T?> showIconDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  bool iconTitle = false,
  Widget? actions,
  bool canGoBack = true,
  double radius = 8,
  double width = 300,
  double insetPadding = 24,
  IconDialogThemeData theme = const IconDialogThemeData(),
  AlertIconType iconType = AlertIconType.alert,
}) {
  Widget builder(BuildContext context) => IconDialogWidget(
    title: title,
    content: content,
    iconTitle: iconTitle,
    actions: actions,
    canGoBack: canGoBack,
    radius: radius,
    width: width,
    insetPadding: insetPadding,
    theme: theme,
    iconType: iconType,
  );
  final useCupertino =
      !kIsWeb &&
      switch (Theme.of(context).platform) {
        TargetPlatform.iOS || TargetPlatform.macOS => true,
        _ => false,
      };
  return useCupertino
      ? showCupertinoDialog<T>(
          context: context,
          barrierDismissible: canGoBack,
          builder: builder,
        )
      : showDialog<T>(
          context: context,
          barrierDismissible: canGoBack,
          builder: builder,
        );
}
