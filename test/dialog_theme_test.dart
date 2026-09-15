import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_icon_dialog/flutter_icon_dialog.dart';

void main() {
  testWidgets(
    'follows dark dialog theme and keeps long-content actions visible',
    (tester) async {
      final theme = ThemeData.dark().copyWith(
        dialogTheme: const DialogThemeData(
          backgroundColor: Color(0xff123456),
          titleTextStyle: TextStyle(color: Colors.amber),
        ),
      );
      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: Scaffold(
            body: IconDialogWidget(
              title: 'Title',
              content: 'Long content\n' * 100,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final title = tester.widget<Text>(find.text('Title'));
      expect(title.style!.color, Colors.amber);
      final surface = tester.widget<Material>(
        find
            .descendant(
              of: find.byType(Dialog),
              matching: find.byType(Material),
            )
            .first,
      );
      expect(surface.color, const Color(0xff123456));
      expect(find.text('OK').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('explicit theme overrides take precedence', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: IconDialogWidget(
            title: 'Title',
            content: 'Content',
            theme: IconDialogThemeData(
              backgroundColor: Colors.blue,
              titleStyle: TextStyle(color: Colors.yellow),
            ),
          ),
        ),
      ),
    );
    expect(
      tester.widget<Dialog>(find.byType(Dialog)).backgroundColor,
      Colors.blue,
    );
    expect(tester.widget<Text>(find.text('Title')).style!.color, Colors.yellow);
  });
}
