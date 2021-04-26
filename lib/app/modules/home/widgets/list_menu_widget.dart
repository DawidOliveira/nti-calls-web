import 'package:flutter/material.dart';
import 'package:nti_calls_web/app/modules/home/home_controller.dart';
import 'package:nti_calls_web/app/modules/home/widgets/item_menu_widget.dart';

class ListMenuWidget extends StatelessWidget {
  const ListMenuWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...controller.setores
            .map(
              (e) => ItemMenuWidget(
                onTap: () {
                  controller.setSelectedValue =
                      e["setor"].toString().toLowerCase();
                  controller.setPage = 0;
                },
                controller: controller,
                icon: e["icon"] as IconData,
                title: e["setor"].toString(),
              ),
            )
            .toList(),
        ItemMenuWidget(
          controller: controller,
          onTap: () async {
            controller.setSelectedValue = "configuração";
            controller.setPage = 1;
          },
          title: "Configuração",
          icon: Icons.settings,
        )
      ],
    );
  }
}
