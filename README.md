# flutter_icon_dialog

Customizable dialogs with animated icons and platform-aware route transitions.

## Installation

Requires Flutter 3.32+ and Dart 3.8+.

```sh
flutter pub add flutter_icon_dialog
```

## Usage

```dart
import 'package:flutter_icon_dialog/flutter_icon_dialog.dart';

await IconDialog.show<void>(
  context: context,
  title: 'Saved',
  content: 'Your changes have been saved.',
  iconTitle: true,
  iconType: AlertIconType.check,
);
```

Set `iconTitle: false` (the default) for a text title.
Use `CustomButtonTheme` to customize the icon, text, background, and button.
Use `widgets` for custom actions and `Navigator.pop(dialogContext, result)`
to return a value from `IconDialog.show<T>`.

`canGoBack: false` blocks barrier and system-back dismissal. The confirmation
button and explicit Navigator.pop calls still close the dialog.

Native iOS and macOS use Cupertino route transitions; other platforms and web
use Material route transitions. The dialog body is customizable on every platform.
Long content scrolls to fit the available height.

![Icon dialog](https://github.com/GiYeongUM/flutter_icon_dialog/raw/main/images/custom_dialog_check.gif)

## Development

```sh
flutter pub get
dart format --output=none --set-exit-if-changed lib example test
flutter analyze --fatal-infos
flutter test
flutter pub publish --dry-run
```

CI checks the minimum supported Flutter version and the latest stable channel.

## Migration

This release requires Dart 3.8 and Flutter 3.32 or newer. Existing constructor
and method arguments remain supported. See [CHANGELOG.md](CHANGELOG.md) for fixes.

## License

MIT. See [LICENSE](LICENSE).


