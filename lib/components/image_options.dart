import 'package:flutter/material.dart';

//TODO: Highlight/Shade selected background.
//TODO: Toggle on/off shaded item.
class ImageOptions extends StatelessWidget {
  final List<String> imageOptionItems;
  final String label;

  ImageOptions({@required this.imageOptionItems, this.label});

  List<Widget> getImageWidgets() {
    var output = List<Widget>();
    for (var imageOptionItem in imageOptionItems) {
      output.add(Padding(
        padding: EdgeInsets.all(2.0),
        child: Image.asset(imageOptionItem),
      ));
    }
    return output;
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
        SizedBox(
          height: screenSize.height * 0.25,
          child: ListView(
            children: getImageWidgets(),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
