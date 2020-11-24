import 'package:cyberpunkcountdown/behaviours/storage_service.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends StorageService {
  static const _backgroundKey = 'background';

  SharedPreferences _preferences;

  LocalStorageService() {
    _initialise();
  }

  _initialise() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  String getBackground() =>
      _preferences.getString(_backgroundKey) ?? kDefaultBackground;

  @override
  void setBackground(String background) =>
      _preferences.setString(_backgroundKey, background);
}
