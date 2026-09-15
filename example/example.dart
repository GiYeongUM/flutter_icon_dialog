import 'package:flutter/material.dart';
import 'package:flutter_icon_dialog/flutter_icon_dialog.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Icon dialogs',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    ),
    darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigo,
        brightness: Brightness.dark,
      ),
    ),
    home: const ExamplePage(),
  );
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});
  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Icon dialogs')),
    body: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        FilledButton(
          onPressed: () => showIconDialog<void>(
            context: context,
            title: 'Saved',
            content: 'Your changes have been saved.',
            iconTitle: true,
            iconType: AlertIconType.check,
          ),
          child: const Text('Show success dialog'),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () => showIconDialog<void>(
            context: context,
            title: 'Long content',
            content: List.filled(
              30,
              'Actions remain reachable while this content scrolls.',
            ).join('\n'),
          ),
          child: const Text('Show scrollable dialog'),
        ),
      ],
    ),
  );
}
