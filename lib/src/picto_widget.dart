import 'package:auto_size_text/auto_size_text.dart';
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
    this.height = 119,
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

    return SizedBox(
      width: width,
      height: height,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: GestureDetector(
          onLongPress: onLongPress,
          onTap: add ? addFunc : onTap,
          child: Stack(
            children: [
              Container(
                height: 119,
                width: 96,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: groupColor[colorNumber]!, width: 3),
                ),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: imageUrl != null
                              ? Image.network(
                                  imageUrl!,
                                  fit: BoxFit.fill,
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
                    Flexible(
                      fit: FlexFit.loose,
                      child: AutoSizeText(
                        text == '' ? '' : text.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        minFontSize: 0,
                        maxFontSize: 12,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        wrapWords: false,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
              add
                  ? SizedBox(
                      height: 119,
                      width: 96,
                      child: Center(
                        child: Container(
                          width: 40,
                          height: 40,
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
                      ),
                    )
                  : Container(),
              disable
                  ? Container(
                      height: 119,
                      width: 96,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
