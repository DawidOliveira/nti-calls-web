import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_calls_web/app/repositories/settings/settings_repository.dart';
import 'package:nti_calls_web/app/repositories/task/task_repository.dart';
import 'package:nti_calls_web/app/shared/models/settings.dart';
import 'package:nti_calls_web/app/shared/models/task.dart';

class HomeController extends GetxController {
  final TaskRepository _tr;
  final SettingsRepository _sr;
  HomeController(this._tr, this._sr);

  final List<String> suggestionList = ["teste1", "teste2", "ateste"];
  final List<TaskModel> tasks = [];

  final searchController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await getTasks();
    setSelectedValue = _sr.settings.value.sectorSelected;
  }

  final setores = [
    {
      "setor": "Sistemas",
      "icon": Icons.system_update,
    },
    {
      "setor": "Redes",
      "icon": Icons.network_wifi,
    },
    {
      "setor": "Manutenção",
      "icon": Icons.build_rounded,
    },
  ];

  final page = 0.obs;
  int get pageValue => page.value;
  set setPage(int value) => page.value = value;

  final selected = "redes".obs;
  String get selectedValue => selected.value;
  set setSelectedValue(String value) {
    selected.value = value;
    _sr.saveSettings(
      SettingsModel(
        isDark: _sr.settings.value.isDark,
        sectorSelected: value,
      ),
    );
  }

  Future getTasks() async {
    tasks.addAll([...await _tr.getAllTasks()]);
  }
}
