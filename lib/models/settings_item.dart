import 'package:flutter/material.dart';

class SettingsItem {
  bool isSelected;
  var value;
  final String displayImage;

  SettingsItem({@required this.isSelected, @required this.displayImage, @required this.value});
}
