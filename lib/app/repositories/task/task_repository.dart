import 'package:nti_calls_web/app/repositories/local/local_storage_repository.dart';
import 'package:nti_calls_web/app/shared/models/task.dart';
import 'package:uuid/uuid.dart';

abstract class ITaskRepository {
  Future saveTask({
    required String username,
    required String setor,
    required String desc,
    required String place,
    required TaskStatus status,
    required DateTime createdAt,
  });

  Future<List<TaskModel>> getAllTasks();

  Future removeTask(String id);
}

class TaskRepository implements ITaskRepository {
  final LocalStorageRepository _ls;
  TaskRepository(this._ls);

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final response = await _ls.getData("tasks") as List?;

    return response?.map((e) => TaskModel.fromMap(e)).toList() ?? [];
  }

  @override
  Future removeTask(String id) async {
    try {
      final response = await _ls.getData("tasks") as List;
      response.removeWhere((element) => element['id'] == id);
      await _ls.saveData(key: "tasks", data: response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future saveTask(
      {required String username,
      required String setor,
      required String desc,
      required String place,
      required TaskStatus status,
      required DateTime createdAt}) async {
    try {
      final data = TaskModel(
        id: Uuid().v4(),
        username: username,
        setor: setor,
        desc: desc,
        place: place,
        status: status,
        createdAt: createdAt,
      );

      final response = await _ls.getData("tasks") as List? ?? [];
      response.add(data.toMap());

      _ls.saveData(key: "tasks", data: response);
    } catch (e) {
      print(e);
    }
  }
}
