import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nti_calls_web/app/core/app_colors.dart';
import './settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.BLUE,
      height: size.height,
      width: size.width,
    );
  }
}
