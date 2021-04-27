import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nti_calls_web/app/modules/home/widgets/content_widget.dart';
import 'package:nti_calls_web/app/modules/home/widgets/menu_widget.dart';
import 'package:nti_calls_web/app/modules/settings/settings_page.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Row(
          children: [
            MenuWidget(
              controller: controller,
            ),
            Obx(
              () => Expanded(
                child: controller.pageValue == 0
                    ? ContentWidget(controller: controller)
                    : SettingsPage(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
