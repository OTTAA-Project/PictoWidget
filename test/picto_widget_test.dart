import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:picto_widget/src/picto_widget.dart';

void main(){
  Icon icon = Icon(Icons.house,color: Colors.green);
  PictoWidget pictoWidget = PictoWidget(text: 'Hello', onTap: (){
    print("Hello");
  },image: icon,);
  group('picto_widget_test', () {
    testWidgets('find icon', (widgetTester)async{
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
              body:pictoWidget)
          ,
        ),
      );
      await widgetTester.pumpAndSettle(Duration(milliseconds: 10));
      expect(find.byWidget(icon), findsOneWidget);
    });
    testWidgets('find Text', (WidgetTester tester) async {

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
              body:pictoWidget)
          ,
        ),
      );
      await tester.pumpAndSettle(Duration(milliseconds: 10),EnginePhase.build,Duration(minutes: 1));
      expect(find.text('HELLO'), findsWidgets);
    });
  });

}