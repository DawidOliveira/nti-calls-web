import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_calls_web/app/core/core.dart';
import 'package:nti_calls_web/app/modules/home/home_controller.dart';

class ItemMenuWidget extends StatelessWidget {
  const ItemMenuWidget({
    Key? key,
    required this.controller,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final HomeController controller;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTileTheme(
        selectedColor: AppColors.BLUE_HOVER,
        child: ListTile(
          onTap: onTap,
          selected: controller.selectedValue == title.toLowerCase(),
          title: Text(
            title.toString(),
            style: AppTextStyles.label,
          ),
          leading: Icon(icon),
        ),
      ),
    );
  }
}
