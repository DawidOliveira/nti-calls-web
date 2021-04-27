import 'package:nti_calls_web/app/repositories/local/local_storage_repository.dart';
import 'package:nti_calls_web/app/shared/models/settings.dart';
import 'package:get/get.dart';

class SettingsRepository {
  final LocalStorageRepository _ls;

  SettingsRepository(this._ls) {
    getSettings();
  }

  late final settings = SettingsModel(isDark: false, sectorSelected: '').obs;

  Future<void> saveSettings(SettingsModel data) async {
    try {
      await _ls.saveData(key: "settings", data: {
        "isDark": data.isDark,
        "sectorSelected": data.sectorSelected,
      });
      settings.value = data;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSettings() async {
    settings.value = SettingsModel.fromMap((await _ls.getData("settings") ??
        {
          'isDark': true,
          'sectorSelected': 'sistemas',
        }));
  }
}
