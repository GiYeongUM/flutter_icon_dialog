import 'package:icon_animated/icon_animated.dart';

/// Icons supported by an icon dialog.
enum AlertIconType {
  check,
  fail,
  alert,
  trendingUp,
  trendingDown,
  search,
  message,
  add,
  download,
  menu,
  bluetooth;

  /// The corresponding outline icon.
  IconType get icon => switch (this) {
    check => IconType.check,
    fail => IconType.fail,
    alert => IconType.alert,
    trendingUp => IconType.trendingUp,
    trendingDown => IconType.trendingDown,
    search => IconType.search,
    message => IconType.message,
    add => IconType.add,
    download => IconType.download,
    menu => IconType.menu,
    bluetooth => IconType.bluetooth,
  };
}
