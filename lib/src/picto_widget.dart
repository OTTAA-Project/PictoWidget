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
  final double height;

  /// The width of the widget
  final double width;

  /// The border radius of the widget
  final double borderRadius;

  /// The image url to display
  ///
  /// deprecated Use [image] instead
  @Deprecated("Use image instead")
  final String? imageUrl;

  /// The color number of the widget
  final int colorNumber;

  /// The image to display
  final Widget? image;

  /// To disable the widget with the gradient
  final bool disable;

  /// to show add functionality
  final bool add;

  /// add function
  final VoidCallback? addFunc;

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
    this.text = '',
    required this.onTap,
    this.height = 124,
    this.width = 96,
    this.onLongPress,
    this.imageUrl,
    this.image,
    this.colorNumber = 6,
    this.borderRadius = 16,
    this.disable = false,
    this.add = false,
    this.addFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(colorNumber >= 1 && colorNumber <= 6);
    assert(image != null || imageUrl != null);
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: add ? addFunc : onTap,
      child: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: groupColor[colorNumber]!, width: 3),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: imageUrl != null
                        ? Image.network(
                            imageUrl!,
                            fit: BoxFit.fill,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.orange,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )
                        : image != null
                            ? image!
                            : Container(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text == '' ? '' : text.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            disable
                ? Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )
                : Container(),
            add
                ? Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: groupColor[2],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
