# Migrating to flutter_icon_dialog 2.0

[← README](README.md) · [Release history](CHANGELOG.md)

Flutter 3.32 and Dart 3.8 remain the minimum supported versions. Update the dependency
to `flutter_icon_dialog: ^2.0.0`, apply the changes below, then run `flutter analyze`
and your application's tests.

## Public API changes

| 1.x                         | 2.0                         |
| --------------------------- | --------------------------- |
| IconDialog.show<T>(...)     | showIconDialog<T>(...)      |
| widgets                     | actions                     |
| buttonTheme                 | theme                       |
| CustomButtonTheme           | IconDialogThemeData         |
| widget.typeChanger(type)    | type.icon                   |
| Fixed white/black defaults  | Ambient theme defaults      |
| Nullable width, default 300 | Non-null width, default 300 |
| insetPadding default 56     | insetPadding default 24     |

### Before

```dart
IconDialog.show(
  context: context,
  title: 'Saved',
  content: 'Done',
  buttonTheme: const CustomButtonTheme(),
)
```

### After

```dart
showIconDialog<void>(
  context: context,
  title: 'Saved',
  content: 'Done',
  theme: const IconDialogThemeData(),
)
```

IconDialogThemeData properties are nullable overrides except for iconSize. Use explicit
colors to preserve a custom 1.x palette. Custom actions now stay outside the scrollable
content. The default button text follows MaterialLocalizations.

## Verification checklist

- Check light and dark themes with your app's color scheme.
- Check large text and narrow layouts.
- Check right-to-left layouts where applicable.
- Check screen-reader labels and reduced-motion behavior.
- Run application tests after updating call sites.
