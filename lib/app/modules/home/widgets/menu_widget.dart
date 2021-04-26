import 'package:flutter/material.dart';
import 'package:nti_calls_web/app/core/app_colors.dart';
import 'package:nti_calls_web/app/core/app_text_styles.dart';
import 'package:nti_calls_web/app/modules/home/home_controller.dart';
import 'package:nti_calls_web/app/modules/home/widgets/list_menu_widget.dart';
import 'package:nti_calls_web/app/modules/home/widgets/logo_widget.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.only(top: 40, bottom: 20, left: 30, right: 30),
      color: AppColors.MENU_COLOR_DARK,
      child: Column(
        children: [
          LogoWidget(),
          SizedBox(
            height: 50,
          ),
          ListMenuWidget(controller: controller),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.copyright,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Dáwid Silva',
                style: AppTextStyles.footer,
              ),
            ],
          )
        ],
      ),
    );
  }
}
