import 'package:flutter/material.dart';

final Map<int, Color> groupColor = {
  1: Colors.yellow,
  2: const Color(0xFFFF6900),
  3: Colors.green,
  4: Colors.blue,
  5: Colors.purple,
  6: Colors.black,
};

class PictoWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  VoidCallback? onLongPress;
  final double height;
  final double width;
  final String imageUrl;
  int? colorNumber;
  PictoWidget({
    required this.text,
    required this.onTap,
    required this.height,
    required this.width,
    this.onLongPress,
    required this.imageUrl,
    this.colorNumber = 6,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(height * 0.03),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                //height: 320,
                margin: EdgeInsets.only(top: height * 0.04, left: height * 0.02, right: height * 0.02),
                padding:  EdgeInsets.all(height * 0.015),
                decoration: BoxDecoration(
                    color: groupColor[colorNumber],
                    borderRadius: BorderRadius.circular(height * 0.03)),
                child: Container(
                  // padding:  EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      loadingBuilder:
                          (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                            value:
                            loadingProgress.expectedTotalBytes !=
                                null
                                ? loadingProgress
                                .cumulativeBytesLoaded /
                                loadingProgress
                                    .expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                    ),
                  ),
                ),
              ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(fontSize: height * 0.04, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}