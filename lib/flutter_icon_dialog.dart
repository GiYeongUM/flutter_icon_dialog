library flutter_icon_dialog;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:icon_animated/widgets/icon_animated.dart';

enum AlertIconType {
  check,
  fail,
  alert,
  trendingUp,
  trendingDown,
  search,
  message,
  plus,
  download,
  menu,
  bluetooth,
}

class IconDialog {
  static show({
    required BuildContext context, required String title, required String content,
    bool iconTitle = false, Widget? widgets, bool canGoBack = true, double radius = 8.0,
    double? width, double insetPadding = 56.0, CustomButtonTheme buttonTheme = const CustomButtonTheme(),
    AlertIconType iconType = AlertIconType.alert,
  }) {
    return kIsWeb ? showDialog(
      context: context,
      barrierDismissible: canGoBack,
      builder: (BuildContext context) {
        return IconDialogWidget(
          title: title,
          iconTitle: iconTitle,
          content: content,
          widgets: widgets,
          canGoBack: canGoBack,
          radius: radius,
          width: width,
          insetPadding: insetPadding,
          buttonTheme: buttonTheme,
        );
      },
    ) : defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS ? showCupertinoDialog(
      context: context,
      barrierDismissible: canGoBack,
      builder: (BuildContext context) {
        return IconDialogWidget(
          title: title,
          iconTitle: iconTitle,
          content: content,
          widgets: widgets,
          canGoBack: canGoBack,
          radius: radius,
          width: width,
          insetPadding: insetPadding,
          buttonTheme: buttonTheme,
          iconType: iconType,
        );
      },
    ) : showDialog(
      context: context,
      barrierDismissible: canGoBack,
      builder: (BuildContext context) {
        return IconDialogWidget(
          title: title,
          iconTitle: iconTitle,
          content: content,
          widgets: widgets,
          canGoBack: canGoBack,
          radius: radius,
          width: width,
          insetPadding: insetPadding,
          buttonTheme: buttonTheme,
        );
      },
    );
  }
}

class IconDialogWidget extends StatefulWidget {
  final String title;
  final bool iconTitle;
  final String content;
  final Widget? widgets;
  final bool canGoBack;
  final double radius;
  final double? width;
  final double insetPadding;
  final CustomButtonTheme buttonTheme;
  final AlertIconType iconType;

  const IconDialogWidget(
      {Key? key,
      required this.title,
      this.iconTitle = false,
      this.content = '',
      this.widgets,
      this.canGoBack = true,
      this.insetPadding = 56.0,
      this.radius = 8.0,
      this.width,
      this.buttonTheme = const CustomButtonTheme(), this.iconType = AlertIconType.alert})
      : super(key: key);

  @override
  State<IconDialogWidget> createState() => _IconDialogWidgetState();
}

class _IconDialogWidgetState extends State<IconDialogWidget> with TickerProviderStateMixin {

  late final AnimationController _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
  late final Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc));

  var isDisposed = false;

  @override
  void initState() {
    if (isDisposed) {
      return;
    }
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.canGoBack,
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius)),
        insetPadding: EdgeInsets.symmetric(horizontal: widget.insetPadding),
        child: Container(
          width: widget.width ?? 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.buttonTheme.backgroundColor
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.iconTitle
                  ? Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 32),
                      child: IconAnimated(
                        color: widget.buttonTheme.iconColor,
                        progress: _animation,
                        size: widget.buttonTheme.iconSize,
                        iconType: typeChanger(widget.iconType),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 32),
                      child: Text(
                        widget.title,
                        style: widget.buttonTheme.titleStyle,
                      ),
                    ),
              Text(
                widget.content,
                textAlign: TextAlign.center,
                style: widget.buttonTheme.contentStyle,
              ),
              const SizedBox(
                height: 40,
              ),
              widget.widgets ??
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.buttonTheme.buttonColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "OK",
                          style: widget.buttonTheme.contentStyle.copyWith(
                              color: widget.buttonTheme.buttonTextColor),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  typeChanger(AlertIconType iconType){
    switch(iconType) {
      case AlertIconType.check:
        return IconType.check;
      case AlertIconType.fail:
        return IconType.fail;
      case AlertIconType.alert:
        return IconType.alert;
      case AlertIconType.trendingUp:
        return IconType.trendingUp;
      case AlertIconType.trendingDown:
        return IconType.trendingDown;
      case AlertIconType.search:
        return IconType.search;
      case AlertIconType.message:
        return IconType.message;
      case AlertIconType.plus:
        return IconType.plus;
      case AlertIconType.download:
        return IconType.download;
      case AlertIconType.menu:
        return IconType.menu;
      case AlertIconType.bluetooth:
        return IconType.bluetooth;
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }
}

class CustomButtonTheme {
  final Color iconColor;
  final double iconSize;
  final TextStyle titleStyle;
  final TextStyle contentStyle;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color backgroundColor;

  const CustomButtonTheme(
      {this.titleStyle = const TextStyle(),
      this.contentStyle = const TextStyle(),
      this.iconSize = 36.0,
      this.iconColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.buttonColor = Colors.black,
      this.buttonTextColor = Colors.white});
}
