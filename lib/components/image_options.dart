import 'package:cyberpunkcountdown/models/image_option.dart';
import 'package:flutter/material.dart';

//TODO: Highlight/Shade selected background.
class ImageOptions extends StatelessWidget {
  final List<ImageOption> imageOptionItems;
  final String label;
  final Function onPressed;

  ImageOptions({@required this.imageOptionItems, this.label, this.onPressed});

  SingleChildScrollView getImageWidgets() {
    var _options = imageOptionItems.map((x) => Image.asset(x.imagePath)).toList();
    var _selections = imageOptionItems.map((x) => x.isSelected).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ToggleButtons(
        children: _options,
        isSelected: _selections,
        selectedBorderColor: Colors.pink,
        borderWidth: 5,
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        if (label != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(label, style: TextStyle(fontSize: 20)),
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: screenSize.height * 0.30,
            child: getImageWidgets(),
          ),
        ),
      ],
    );
  }
}
