import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nti_calls_web/app/app_widget.dart';
import 'package:nti_calls_web/app/shared/bindings/application_bindings.dart';

void main() async {
  await GetStorage.init();
  ApplicationBindings().dependencies();
  runApp(AppWidget());
}
