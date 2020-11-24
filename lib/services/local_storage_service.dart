import 'package:cyberpunkcountdown/behaviours/storage_service.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends StorageService {
  static const _backgroundKey = 'background';
  static const _logoKey = 'logo';
  static const _countdownLabelKey = 'label';

  SharedPreferences _preferences;

  initialise() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  String getBackground() =>
      _preferences.getString(_backgroundKey) ?? kDefaultBackground;

  @override
  String getLogo() => _preferences.getString(_logoKey) ?? kDefaultLogo;

  @override
  void setBackground(String background) =>
      _preferences.setString(_backgroundKey, background);

  @override
  void setLogo(String logo) => _preferences.setString(_logoKey, logo);
}
