import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_dialog/flutter_icon_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icon_animated/icon_animated.dart';

void main() {
  for (final platform in [
    TargetPlatform.android,
    TargetPlatform.iOS,
    TargetPlatform.macOS,
  ]) {
    testWidgets('forwards the selected icon on ${platform.name}', (
      tester,
    ) async {
      debugDefaultTargetPlatformOverride = platform;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      late BuildContext context;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (value) {
              context = value;
              return const Scaffold();
            },
          ),
        ),
      );
      final closed = IconDialog.show<void>(
        context: context,
        title: 'Done',
        content: 'Saved',
        iconTitle: true,
        iconType: AlertIconType.check,
      );
      await tester.pumpAndSettle();
      expect(
        tester.widget<IconAnimated>(find.byType(IconAnimated)).iconType,
        IconType.check,
      );
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await closed;
      expect(find.byType(IconDialogWidget), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });
  }

  testWidgets(
    'blocks back and barrier dismissal but allows explicit confirmation',
    (tester) async {
      late BuildContext context;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (value) {
              context = value;
              return const Scaffold();
            },
          ),
        ),
      );
      final closed = IconDialog.show<void>(
        context: context,
        title: 'Confirm',
        content: 'Please confirm',
        canGoBack: false,
      );
      await tester.pumpAndSettle();
      await tester.tapAt(const Offset(5, 5));
      await tester.pumpAndSettle();
      expect(find.byType(IconDialogWidget), findsOneWidget);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.byType(IconDialogWidget), findsOneWidget);
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await closed;
      expect(find.byType(IconDialogWidget), findsNothing);
    },
  );

  testWidgets('returns a typed result from custom actions', (tester) async {
    late BuildContext context;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (value) {
            context = value;
            return const Scaffold();
          },
        ),
      ),
    );
    final result = IconDialog.show<bool>(
      context: context,
      title: 'Confirm',
      content: '',
      widgets: Builder(
        builder: (dialogContext) => TextButton(
          onPressed: () => Navigator.pop(dialogContext, true),
          child: const Text('Accept'),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Accept'));
    await tester.pumpAndSettle();
    expect(await result, isTrue);
  });

  testWidgets('long content scrolls without a render overflow', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: IconDialogWidget(
            title: 'Long content',
            content: 'A line of content.\n' * 100,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
