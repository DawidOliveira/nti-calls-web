import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nti_calls_web/app/core/core.dart';
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
        appBar: MediaQuery.of(context).size.width <= 1455
            ? AppBar(
                backgroundColor: AppColors.CONTENT_COLOR_DARK,
                title: Text('NTI Chamados'),
              )
            : null,
        drawer: MediaQuery.of(context).size.width <= 1455
            ? MenuWidget(controller: controller)
            : null,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: MediaQuery.of(context).size.width >= 1455,
              child: MenuWidget(
                controller: controller,
              ),
            ),
            Obx(
              () => controller.pageValue == 0
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: ContentWidget(controller: controller),
                      ),
                    )
                  : SettingsPage(),
            )
          ],
        ),
      ),
    );
  }
}
