import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_calls_web/app/repositories/settings/settings_repository.dart';
import 'package:nti_calls_web/app/repositories/task/task_repository.dart';
import 'package:nti_calls_web/app/shared/models/settings.dart';
import 'package:nti_calls_web/app/shared/models/task.dart';

class HomeController extends GetxController {
  final TaskRepository _tr;
  final SettingsRepository _sr;
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
  final selected = "".obs;
  final suggestionList = ["teste1", "teste2", "ateste"].obs;
  final listAux = [
    TaskModel(
      createdAt: DateTime.now(),
      id: "123",
      desc: "formi",
      place: "bloco b",
      setor: "sistemas",
      status: TaskStatus.pending,
      username: 'Dawid Oliveira',
    ),
    TaskModel(
      createdAt: DateTime.now(),
      id: "123",
      desc: "form",
      place: "bloco b",
      setor: "sistemas",
      status: TaskStatus.pending,
      username: 'Dawid Oliveira',
    ),
    TaskModel(
      createdAt: DateTime.now(),
      id: "123",
      desc: "sem internet",
      place: "bloco c",
      setor: "redes",
      status: TaskStatus.pending,
      username: 'Dawid Oliveira',
    ),
    TaskModel(
      createdAt: DateTime.now(),
      id: "123",
      desc: "sem interneta",
      place: "bloco c",
      setor: "redes",
      status: TaskStatus.pending,
      username: 'Dawid Oliveira',
    )
  ];
  final tasks = <TaskModel>[].obs;

  final filteredTasks = <TaskModel>[].obs;
  final searchController = TextEditingController();

  final countTasks = {
    "pending": 0,
    "in_progress": 0,
    "done": 0,
  }.obs;

  HomeController(this._tr, this._sr);

  @override
  void onInit() async {
    super.onInit();
    setSelectedValue = _sr.settings.value.sectorSelected;
    await getTasks();
    if (selectedValue == 'configuração') {
      setPage = 1;
    }
    selected.listen((value) async {
      if (selectedValue == 'configuração') {
        setPage = 1;
        return;
      }
      setPage = 0;
      await getTasks();
    });
  }

  int get pageValue => page.value;
  set setPage(int value) => page.value = value;

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

  void setFilteredTasks(String? value) {
    if (value == null || value.isEmpty)
      filteredTasks.value = tasks;
    else
      filteredTasks.value = tasks
          .where((e) => e.desc.toLowerCase().contains(value.toLowerCase()))
          .toList();
  }

  void addTest() {
    final status = {
      'done': TaskStatus.done,
      'pending': TaskStatus.pending,
      'in_progress': TaskStatus.in_progress,
    };
    final test = TaskModel(
        id: 'id',
        username: 'username',
        setor: 'redes',
        desc: 'desc',
        place: 'place',
        status: TaskStatus.done,
        createdAt: DateTime.now());
    tasks.add(test);
    updateCountDone();
    ascendingList();
  }

  Future getTasks() async {
    tasks.value = [
      ...listAux.where((element) => element.setor == selected.value).toList(),
      ...(await _tr.getAllTasks())
          .where((element) => element.setor == selected.value)
          .toList()
    ];
    filteredTasks.value = tasks;
    updateCountPending();
    updateCountInProgress();
    updateCountDone();
    updateSuggestionList();
    ascendingList();
  }

  void updateSuggestionList() {
    suggestionList.value = tasks.map((e) => e.desc).toList();
  }

  void ascendingList() {
    tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    filteredTasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }

  void updateCountPending() {
    countTasks["pending"] = tasks
        .where((element) => element.status == TaskStatus.pending)
        .toList()
        .length;
  }

  void updateCountInProgress() {
    countTasks["in_progress"] = tasks
        .where((element) => element.status == TaskStatus.in_progress)
        .toList()
        .length;
  }

  void updateCountDone() {
    countTasks["done"] = tasks
        .where((element) => element.status == TaskStatus.done)
        .toList()
        .length;
  }
}
