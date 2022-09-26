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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PictoWidget(
              onTap: () {
                print('tapped');
              },
              text: 'Example',
              imageUrl: "https://picsum.photos/200",
              image: CachedNetworkImage(imageUrl: "https://picsum.photos/200", fit: BoxFit.cover),
              colorNumber: 2,
              onLongPress: () {
                print('long pressed');
              },
            ),
          ),
        ],
      ),
    );
  }
}
