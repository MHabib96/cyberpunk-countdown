import 'package:cyberpunkcountdown/services/local_storage_service.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:cyberpunkcountdown/utilities/globals.dart' as globals;
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  _getLocalData() async {
    var _storage = LocalStorageService();
    await _storage.initialise();
    globals.localStorage = _storage;
    Navigator.pushReplacementNamed(context, kCountdownScreenRoute);
  }

  @override
  void initState() {
    super.initState();
    _getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.pink);
  }
}
