import 'package:get/get.dart';
import 'package:nti_calls_web/app/repositories/settings/settings_repository.dart';
import 'package:nti_calls_web/app/shared/models/settings.dart';

class SettingsController extends GetxController {
  final SettingsRepository _sr;

  final switchIsDark = false.obs;
  SettingsController(this._sr);

  @override
  void onInit() {
    super.onInit();
    switchIsDark.value = _sr.settings.value.isDark;
  }

  Future<void> changeSwitch(bool value) async {
    await _sr.saveSettings(
      SettingsModel(
        isDark: value,
        sectorSelected: _sr.settings.value.sectorSelected,
      ),
    );

    switchIsDark.value = value;
  }
}
