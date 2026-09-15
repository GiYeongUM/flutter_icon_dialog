# flutter_icon_dialog

Clear feedback. Accessible actions. Theme-aware dialogs.

[![pub package](https://img.shields.io/pub/v/flutter_icon_dialog.svg)](https://pub.dev/packages/flutter_icon_dialog)
[![CI](https://github.com/GiYeongUM/flutter_icon_dialog/actions/workflows/ci.yml/badge.svg)](https://github.com/GiYeongUM/flutter_icon_dialog/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

[Quick start](#quick-start) · [Configuration](#configuration) ·
[Example](example/example.dart) · [Migration](MIGRATION.md) · [Changelog](CHANGELOG.md)

## At a glance

- Animated status icons or a text title.
- Platform-aware route transitions on native iOS/macOS, other platforms, and web.
- Scrollable content with a persistent action area.
- Theme-derived colors and typography, localized confirmation text, and typed results.

## Quick start

**Requirements:** Flutter **3.32+** · Dart **3.8+**

```sh
flutter pub add flutter_icon_dialog
```

To use this major version explicitly:

```yaml
dependencies:
  flutter_icon_dialog: ^2.0.0
```

```dart
import 'package:flutter_icon_dialog/flutter_icon_dialog.dart';

await showIconDialog<void>(
  context: context,
  title: 'Saved',
  content: 'Your changes have been saved.',
  iconTitle: true,
  iconType: AlertIconType.check,
);
```

## Configuration

| Option                    | Default               | Purpose                                             |
| ------------------------- | --------------------- | --------------------------------------------------- |
| context / title / content | required              | Route context and message.                          |
| iconTitle                 | false                 | Replace the text heading with an animated icon.     |
| iconType                  | AlertIconType.alert   | Status icon.                                        |
| actions                   | localized OK button   | Custom action widget.                               |
| canGoBack                 | true                  | Allow system-back and barrier dismissal.            |
| theme                     | IconDialogThemeData() | Optional icon, text, surface, and button overrides. |
| radius / width            | 8 / 300               | Dialog shape and preferred width.                   |
| insetPadding              | 24                    | Horizontal route padding; vertical padding is 24.   |

## Results and custom actions

```dart
final accepted = await showIconDialog<bool>(
  context: context,
  title: 'Continue?',
  content: 'Choose whether to continue.',
  actions: Builder(
    builder: (dialogContext) => TextButton(
      onPressed: () => Navigator.pop(dialogContext, true),
      child: const Text('Continue'),
    ),
  ),
);
```

Import `package:flutter/material.dart` for the Flutter widgets in this example. Use the
dialog's own context when popping a route, especially with nested navigators.

`canGoBack: false` blocks system-back and barrier dismissal. Explicit `Navigator.pop`
and the confirmation button can still close the dialog. Platform selection follows
`ThemeData.platform`; web uses a Material route. The body uses Material styling on every
platform.

## Package structure

```text
lib/
├── flutter_icon_dialog.dart    # Public exports
└── src/
    ├── show_icon_dialog.dart   # Route presentation
    ├── icon_dialog_widget.dart
    ├── icon_dialog_theme.dart
    ├── alert_icon_type.dart
    └── widgets/dialog_header.dart
```

Import the package entry point. Files under `src/` are implementation details and are
not a supported import surface.

## Development

```sh
flutter pub get
dart format --output=none --set-exit-if-changed lib example test
flutter analyze --fatal-infos
flutter test
flutter pub publish --dry-run
```

CI validates Flutter 3.32.0 and the latest stable channel. When switching SDK versions
locally, run `flutter clean` before testing to avoid reusing incompatible compiled
shader assets.

## Upgrading from 1.x

Version 2.0 includes intentional API changes. Follow [MIGRATION.md](MIGRATION.md) before
changing an existing application's dependency constraint.

## Support and license

Report reproducible issues in
[GitHub Issues](https://github.com/GiYeongUM/flutter_icon_dialog/issues). Include the
Flutter version and a minimal example.

Released under the [MIT license](LICENSE).
