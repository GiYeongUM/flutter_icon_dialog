# Changelog

[← README](README.md) · [Migration guide](MIGRATION.md)

## 2.0.0

### Changed

- Split route presentation, dialog body, header, theme data, and icon mapping into
  separate modules.
- Replace the static utility API with showIconDialog<T>.
- Follow dialog/theme colors and typography; localize the default confirmation label.
- Keep actions visible while long content scrolls.
- Use icon_animated 2.0.0 for layout-aware rendering and reduced motion.

### Migration

- This major release intentionally changes public APIs; see
  [MIGRATION.md](MIGRATION.md).
- Minimum requirements remain Flutter 3.32 and Dart 3.8.

### Documentation

- Refresh examples, configuration tables, architecture notes, and migration
  instructions.

## 1.3.0

- Update icon_animated to 1.3.0.
- Require Dart 3.8 and Flutter 3.32 or newer; adopt flutter_lints 6.
- Forward the selected icon on every platform and return typed dialog results.
- Use PopScope for back navigation and scroll long content.
- Use an accessible confirmation button and add route regression tests.

## 1.2.1

- icon package update

## 1.2.0

- fix package update

## 1.1.3

- fix backgroundColor issue

## 1.1.2

- add backgroundColor

## 1.1.1

- fix on web (remove Platform)

## 1.1.0

- add web widget

## 1.0.5

- update icon package version

## 1.0.4

- add pubignore

## 1.0.3

- change function name dialog to show

## 1.0.2

- drop images on package

## 1.0.1

- fix ButtonTheme

## 1.0.0

- publish project on pub.dev
- project Separation
