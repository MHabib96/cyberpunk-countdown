import 'package:cyberpunkcountdown/services/local_storage_service.dart';
import 'package:cyberpunkcountdown/types/settings_type.dart';

class SettingsService {
  void setSettings(SettingsType setting, dynamic change) {
    var localStorage = LocalStorageService();

    switch (setting) {
      case SettingsType.background:
        return localStorage.setBackground(change);
      case SettingsType.logo:
        return localStorage.setLogo(change);
      case SettingsType.label:
        return localStorage.setCountdownLabel(change);
    }
  }
}
