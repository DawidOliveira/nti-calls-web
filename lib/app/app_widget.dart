import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_calls_web/app/core/app_theme.dart';
import 'package:nti_calls_web/app/core/routes.dart';
import 'package:nti_calls_web/app/repositories/settings/settings_repository.dart';
import 'package:nti_calls_web/app/shared/bindings/application_bindings.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'Chamados NTI',
        initialBinding: ApplicationBindings(),
        theme: Get.find<SettingsRepository>().settings.value.isDark
            ? AppTheme.themeDark
            : AppTheme.themeLight,
        getPages: AppRoutes.pages,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
