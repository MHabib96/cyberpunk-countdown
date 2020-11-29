import 'package:cyberpunkcountdown/models/settings_item.dart';
import 'package:flutter/material.dart';

//TODO: Highlight/Shade selected background.
class SettingsOptions extends StatelessWidget {
  final List<SettingsItem> settingsItems;
  final String label;
  final double height;
  final Function(int) onPressed;

  SettingsOptions({@required this.settingsItems, this.label, this.height, this.onPressed});

  SingleChildScrollView getImageWidgets() {
    var _options = settingsItems.map((x) => Image.asset(x.displayImage)).toList();
    var _selections = settingsItems.map((x) => x.isSelected).toList();

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
            height: height,
            child: getImageWidgets(),
          ),
        ),
      ],
    );
  }
}
