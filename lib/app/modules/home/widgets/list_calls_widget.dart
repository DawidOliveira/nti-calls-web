import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_calls_web/app/modules/home/home_controller.dart';
import 'package:nti_calls_web/app/modules/home/widgets/section_tile_widget.dart';

class ListCallsWidget extends StatelessWidget {
  const ListCallsWidget({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SectionTileWidget(
          size: size,
          status: 'pending',
          controller: controller,
          initiallyExpanded: true,
        ),
        SizedBox(
          height: 20,
        ),
        SectionTileWidget(
          size: size,
          controller: controller,
          status: 'in_progress',
          initiallyExpanded: true,
        ),
        SizedBox(
          height: 20,
        ),
        SectionTileWidget(
          size: size,
          controller: controller,
          status: 'done',
        ),
      ],
    );
  }
}
