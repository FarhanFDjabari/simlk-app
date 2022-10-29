import 'package:hive/hive.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';

class HiveAdapters {
  void registerAdapter() {
    Hive.registerAdapter<Mahasiswa>(MahasiswaAdapter());
    // Hive.registerAdapter<UserCountModel>(UserCountModelAdapter());
  }
}
