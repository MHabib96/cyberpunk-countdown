import 'package:cyberpunkcountdown/components/settings_options.dart';
import 'package:cyberpunkcountdown/models/settings_item.dart';
import 'package:cyberpunkcountdown/services/local_storage_service.dart';
import 'package:cyberpunkcountdown/services/settings_service.dart';
import 'package:cyberpunkcountdown/types/settings_type.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  static const backgroundImages = [kYellowBackground, kStreetBackground];
  static const logoImages = [kYellowLogo, kBlackLogo, kPinkLogo];
  static const labelImages = [
    kYellowBackground,
    kStreetBackground,
    kYellowBackground,
    kStreetBackground,
    kYellowBackground,
    kStreetBackground
  ];

  SettingsItem _createSettingsItem<T>(String image, T value, T selected) {
    return SettingsItem(
      isSelected: selected == value,
      displayImage: image,
      value: value,
    );
  }

  List<SettingsItem> createSettingsItems<T>(List<String> images, List<T> values, T selected) {
    var output = List<SettingsItem>();

    if (images.length != values.length) throw Exception('length and values are not equal');

    for (int i = 0; i < images.length; i++)
      output.add(_createSettingsItem(images[i], values[i], selected));

    return output;
  }

  Function(int) setSettingsState(SettingsType setting, List<SettingsItem> settingsItems) {
    var _service = SettingsService();

    return (index) {
      setState(() {
        for (int i = 0; i < settingsItems.length; i++) {
          if (i == index) {
            settingsItems[i].isSelected = true;
            _service.setSettings(setting, settingsItems[i].value);
          } else {
            settingsItems[i].isSelected = false;
          }
        }
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var localStorage = LocalStorageService();
    var backgroundItems = createSettingsItems(
      backgroundImages,
      backgroundImages,
      localStorage.getBackground(),
    );
    var logoItems = createSettingsItems(
      logoImages,
      logoImages,
      localStorage.getLogo(),
    );
    var labelItems = createSettingsItems(
      labelImages,
      [0, 1, 2, 3, 4, 5],
      localStorage.getCountdownLabel(),
    );

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Settings', style: TextStyle(fontSize: 30)),
              ),
              SizedBox(height: 10),
              SettingsOptions(
                label: 'Backgrounds',
                settingsItems: backgroundItems,
                height: screenSize.height * 0.3,
                onPressed: setSettingsState(SettingsType.background, backgroundItems),
              ),
              SettingsOptions(
                label: 'Logos',
                settingsItems: logoItems,
                height: screenSize.height * 0.2,
                onPressed: setSettingsState(SettingsType.logo, logoItems),
              ),
              SettingsOptions(
                label: 'Labels',
                settingsItems: labelItems,
                height: screenSize.height * 0.3,
                onPressed: setSettingsState(SettingsType.label, labelItems),
              ),
              RaisedButton(onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}
