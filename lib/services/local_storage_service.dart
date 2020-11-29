import 'package:cyberpunkcountdown/behaviours/storage_service.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends StorageService {
  static const _backgroundKey = 'background';
  static const _logoKey = 'logo';
  static const _countdownLabelKey = 'label';

  SharedPreferences _preferences;

  //Singleton
  LocalStorageService._();
  static final LocalStorageService _instance = LocalStorageService._();
  factory LocalStorageService() => _instance;

  //Must run before calling overrides
  initialise() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  String getBackground() => _preferences.getString(_backgroundKey) ?? kDefaultBackground;

  @override
  String getLogo() => _preferences.getString(_logoKey) ?? kDefaultLogo;

  @override
  int getCountdownLabel() => _preferences.getInt(_countdownLabelKey) ?? kDefaultLabel;

  @override
  void setBackground(String background) => _preferences.setString(_backgroundKey, background);

  @override
  void setLogo(String logo) => _preferences.setString(_logoKey, logo);

  @override
  void setCountdownLabel(int label) => _preferences.setInt(_countdownLabelKey, label);
}
