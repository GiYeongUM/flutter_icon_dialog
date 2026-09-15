import 'package:flutter/material.dart';
import 'package:icon_animated/icon_animated.dart';
import '../alert_icon_type.dart';
import '../icon_dialog_theme.dart';

/// Internal title/icon presentation shared by the dialog body.
class DialogHeader extends StatelessWidget {
  const DialogHeader({
    super.key,
    required this.title,
    required this.showIcon,
    required this.iconType,
    required this.theme,
  });

  final String title;
  final bool showIcon;
  final AlertIconType iconType;
  final IconDialogThemeData theme;

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: showIcon
          ? IconAnimated(
              active: true,
              size: theme.iconSize,
              iconType: iconType.icon,
              color: theme.iconColor ?? materialTheme.colorScheme.primary,
              semanticLabel: title,
            )
          : Text(
              title,
              textAlign: TextAlign.center,
              style:
                  (materialTheme.dialogTheme.titleTextStyle ??
                          materialTheme.textTheme.headlineSmall)
                      ?.merge(theme.titleStyle),
            ),
    );
  }
}
