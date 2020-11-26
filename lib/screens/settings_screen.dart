import 'package:cyberpunkcountdown/components/image_options.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

//TODO: Background options
//TODO: Logo options
//TODO: label options

//TODO: Display options to preview
class _SettingsScreenState extends State<SettingsScreen> {
  var imageOptions = [
    kYellowBackground,
    kStreetBackground,
    kYellowBackground,
    kStreetBackground,
    kYellowBackground,
    kStreetBackground
  ];

  @override
  Widget build(BuildContext context) {
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
                imageOptionItems: imageOptions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
