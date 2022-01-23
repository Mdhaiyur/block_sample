import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'model/user.dart';

class DatabaseRepository
{
  DatabaseRepository() : super();

  Box? box;

  Future openBox() async {
    box = await Hive.openBox('UserBox');
    return;
  }

  Future<int> addUser(User userModel) async {
    int a = await box!.add(userModel);
    return a;
  }

  Map<dynamic, dynamic> getModels() {
    Map<dynamic, dynamic> a = box!.toMap();
    return a;
  }

  deleteAll() {
    box!.clear();
    return;
  }

}