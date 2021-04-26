import 'package:flutter/material.dart';
import 'package:nti_calls_web/app/core/app_images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.LOGO,
      width: 150,
    );
  }
}
