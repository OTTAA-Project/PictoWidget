import 'package:flutter/material.dart';
import 'package:picto_widget/picto_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picto Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PictoWidgetExample(),
    );
  }
}

class PictoWidgetExample extends StatelessWidget {
  const PictoWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          PictoWidget(
            onTap: () {
              print('tapped');
            },
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.6,
            text: 'Example',
            imageUrl: 'http://via.placeholder.com/350x150',
            colorNumber: 2,
            onLongPress: () {
              print('long pressed');
            },
          ),
        ],
      ),
    );
  }
}
