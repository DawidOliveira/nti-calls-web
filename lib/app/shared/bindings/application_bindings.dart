import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nti_calls_web/app/repositories/local/local_storage_repository.dart';
import 'package:nti_calls_web/app/repositories/settings/settings_repository.dart';
import 'package:nti_calls_web/app/repositories/task/task_repository.dart';
import 'package:nti_calls_web/app/services/notification/notification_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LocalStorageRepository(GetStorage()));
    Get.put(TaskRepository(Get.find<LocalStorageRepository>()));
    Get.put(NotificationService());
    Get.put(SettingsRepository(Get.find<LocalStorageRepository>()));
  }
}
