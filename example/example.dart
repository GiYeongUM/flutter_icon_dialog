import 'package:flutter/material.dart';
import 'package:flutter_icon_dialog/flutter_icon_dialog.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IconDialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('IconDialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){

              IconDialog.show(
                  context: context,
                  title: 'title',
                  content: 'Connect successfully',
              );

                }, child: const Text("save"))
          ],
        ),
      ),
    );
  }
}
