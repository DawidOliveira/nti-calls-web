import 'package:get/get.dart';
import 'package:nti_calls_web/app/repositories/settings/settings_repository.dart';
import 'package:nti_calls_web/app/repositories/task/task_repository.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(
        Get.find<TaskRepository>(), Get.find<SettingsRepository>()));
  }
}
