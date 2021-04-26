import 'package:get/get.dart';
import 'package:nti_calls_web/app/modules/home/home_bindings.dart';
import 'package:nti_calls_web/app/modules/home/home_page.dart';

class Routes {
  static const HOME = '/';
}

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
