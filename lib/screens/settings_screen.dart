import 'package:cyberpunkcountdown/components/image_options.dart';
import 'package:cyberpunkcountdown/models/image_option.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:cyberpunkcountdown/utilities/globals.dart' as globals;
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

//TODO: Logo options
//TODO: label options
class _SettingsScreenState extends State<SettingsScreen> {
  static const backgroundImages = [kYellowBackground, kStreetBackground];

  List<ImageOption> getOptionItems(List<String> options, String selected) {
    var output = List<ImageOption>();
    for (var option in options) {
      output.add(ImageOption(
        isSelected: selected == option,
        imagePath: option,
      ));
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    var backgroundOptions = getOptionItems(backgroundImages, globals.localStorage.getBackground());

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
              ImageOptions(
                label: 'Backgrounds',
                imageOptionItems: backgroundOptions,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < backgroundOptions.length; i++) {
                      if (i == index) {
                        backgroundOptions[i].isSelected = true;
                        globals.localStorage.setBackground(backgroundOptions[i].imagePath);
                      } else {
                        backgroundOptions[i].isSelected = false;
                      }
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
