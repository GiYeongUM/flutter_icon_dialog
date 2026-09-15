import 'package:flutter/material.dart';
import 'alert_icon_type.dart';
import 'icon_dialog_theme.dart';
import 'widgets/dialog_header.dart';

/// A scrollable dialog body with a persistent action area.
class IconDialogWidget extends StatelessWidget {
  const IconDialogWidget({
    super.key,
    required this.title,
    this.content = '',
    this.iconTitle = false,
    this.actions,
    this.canGoBack = true,
    this.radius = 8,
    this.width = 300,
    this.insetPadding = 24,
    this.theme = const IconDialogThemeData(),
    this.iconType = AlertIconType.alert,
  }) : assert(radius >= 0),
       assert(width > 0 && width < double.infinity),
       assert(insetPadding >= 0);

  final String title;
  final String content;
  final bool iconTitle;
  final Widget? actions;
  final bool canGoBack;
  final double radius;
  final double width;
  final double insetPadding;
  final IconDialogThemeData theme;
  final AlertIconType iconType;

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final colors = materialTheme.colorScheme;
    return PopScope(
      canPop: canGoBack,
      child: Dialog(
        backgroundColor: theme.backgroundColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        insetPadding: EdgeInsets.symmetric(
          horizontal: insetPadding,
          vertical: 24,
        ),
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DialogHeader(
                        title: title,
                        showIcon: iconTitle,
                        iconType: iconType,
                        theme: theme,
                      ),
                      Text(
                        content,
                        textAlign: TextAlign.center,
                        style:
                            (materialTheme.dialogTheme.contentTextStyle ??
                                    materialTheme.textTheme.bodyMedium)
                                ?.merge(theme.contentStyle),
                      ),
                    ],
                  ),
                ),
              ),
              actions ??
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: theme.buttonColor ?? colors.primary,
                        foregroundColor:
                            theme.buttonTextColor ?? colors.onPrimary,
                        minimumSize: const Size(0, 48),
                        shape: const RoundedRectangleBorder(),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        MaterialLocalizations.of(context).okButtonLabel,
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
