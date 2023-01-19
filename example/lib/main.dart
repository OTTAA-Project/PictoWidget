import 'package:cached_network_image/cached_network_image.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PictoWidget(
          width: 90,
          height: 800,
          onTap: () {
            print('tapped');
          },
          text: 'Example is preet long thi stime',
          imageUrl: "https://static.arasaac.org/pictograms/2282/2282_300.png",
          image: CachedNetworkImage(imageUrl: "https://static.arasaac.org/pictograms/2282/2282_300.png", fit: BoxFit.cover),
          colorNumber: 2,
          onLongPress: () {
            print('long pressed');
          },
        ),
      ),
    );
  }
}
