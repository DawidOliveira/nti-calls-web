import 'package:get_storage/get_storage.dart';

abstract class ILocalStorageRepository {
  Future saveData({required String key, required dynamic data});
  dynamic getData(String key);
  Future deleteData(String key);
}

class LocalStorageRepository implements ILocalStorageRepository {
  final GetStorage _gs;
  LocalStorageRepository(this._gs);
  @override
  Future deleteData(String key) async {
    try {
      await _gs.remove(key);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<dynamic> getData(String key) async {
    return await _gs.read(key);
  }

  @override
  Future saveData({required String key, required data}) async {
    try {
      await _gs.write(key, data);
    } catch (e) {
      print(e);
    }
  }
}
