import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width <= 1455 ? size.width : size.width - 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width <= 1455 ? size.width : size.width * .15,
            child: ListView(
              shrinkWrap: true,
              children: [
                SwitchListTile(
                  value: controller.switchIsDark.value,
                  onChanged: controller.changeSwitch,
                  title: Text('Alterar tema'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
