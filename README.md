# flutter_icon_dialog

This widget is a simple dialog that deviates from the complex dialog of the flutter.

[![Flutter](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://flutter.dev/)

## Features 

- **Easier**
- [Animated Icons](https://pub.dev/packages/icon_animated)
- Platform matched widget (Android, iOS)

## ⚡ [Installation](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

```yaml
dependencies:
  flutter_icon_dialog: ^<latest_version>
```

## 💪 Usage

## 1. text dialog

Default for this widget is **Text Alert**.

<img width="308" alt="" src="https://github.com/GiYeongUM/flutter_icon_dialog/raw/main/images/custom_dialog_text.gif">

``` dart
IconDialog.dialog(
    context: context,
    title: 'Alert',
    content: 'Save successfully',
);
```


## 2. icon dialog 

Dialog can take advantage of icon title. The icon includes animation, [and here are the icons](https://pub.dev/packages/icon_animated) that you can use.


<img width="308" alt="" src="https://github.com/GiYeongUM/flutter_icon_dialog/raw/main/images/custom_dialog_ios.gif">
<img width="308" alt="" src="https://github.com/GiYeongUM/flutter_icon_dialog/raw/main/images/custom_dialog_check.gif">
<img width="308" alt="" src="https://github.com/GiYeongUM/flutter_icon_dialog/raw/main/images/custom_dialog_bluetooth.gif">

``` dart
IconDialog.dialog(
    context: context, 
    title: "Check", 
    content: "This is Icon", 
    iconTitle: true
);
```

``` dart
IconDialog.dialog(
    context: context, 
    title: "Check", 
    content: "This is Icon", 
    iconTitle: true,
    iconType: AlertIconType.check,
);
```

## 3. platform matched dialog

Dialog works differently depending on the platform. Animation works differently depending on Android or iOS.

<img width="308" alt="" src="https://github.com/GiYeongUM/flutter_icon_dialog/raw/main/images/custom_dialog_android.gif">
<img width="308" alt="" src="https://github.com/GiYeongUM/flutter_icon_dialog/raw/main/images/custom_dialog_ios.gif">

### That's it! Try it.



