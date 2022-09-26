import 'package:flutter/material.dart';

final Map<int, Color> groupColor = {
  1: Colors.yellow,
  2: const Color(0xFFFF6900),
  3: Colors.green,
  4: Colors.blue,
  5: Colors.purple,
  6: Colors.black,
};

/// Widget that displays a picture and a text
class PictoWidget extends StatelessWidget {
  /// The text to display
  final String text;

  /// The callback to call when the widget is tapped
  final VoidCallback onTap;

  /// The callback to call when the widget is long pressed
  final VoidCallback? onLongPress;

  /// The height of the widget
  final double? height;

  /// The width of the widget
  final double? width;

  /// The image url to display
  ///
  /// deprecated Use [image] instead
  @Deprecated("Use image instead")
  final String? imageUrl;

  /// The color number of the widget
  final int? colorNumber;

  /// The image to display
  final Widget? image;

  /// Constructor
  ///
  /// [text] The text to display
  ///
  /// The text, onTap, and colorNumber parameters are required
  ///
  /// The onLongPress, height, width, imageUrl, and image parameters are optional
  ///
  /// The image parameter takes precedence over the imageUrl parameter
  ///
  /// The colorNumber parameter must be between 1 and 6
  ///
  /// The height and width parameters must be greater than 0
  const PictoWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.height,
    this.width,
    this.onLongPress,
    this.imageUrl,
    this.image,
    this.colorNumber = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(colorNumber! >= 1 && colorNumber! <= 6);
    assert(image != null || imageUrl != null);
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(height != null ? height! / 2 : 20),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                //height: 320,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: groupColor[colorNumber],
                  borderRadius: BorderRadius.circular(height != null ? height! * 0.03 : 20),
                ),
                child: Container(
                  // padding:  EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: imageUrl != null
                        ? Image.network(
                            imageUrl!,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.orange,
                                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                ),
                              );
                            },
                          )
                        : image != null
                            ? image!
                            : Container(),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: height != null ? height! * 0.03 : 10),
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(fontSize: height != null ? height! * 0.04 : 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
