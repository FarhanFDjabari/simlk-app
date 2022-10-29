import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simlk_app/firebase_options.dart';
import 'package:simlk_app/src/data/hive/hive_adapters.dart';
import 'package:simlk_app/src/data/hive/hive_constants.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/storage/secure_storage_manager.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';

class Initializer {
  static Future<void> init() async {
    try {
      _initScreenPreference();
      await globalLocalData();
      globalController();
      await initFirebaseService();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> initFirebaseService() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final fcmDeviceId = await FirebaseMessaging.instance.getToken();
    debugPrint('FCM token: $fcmDeviceId');
    await SecureStorageManager().setDeviceToken(value: fcmDeviceId);
  }

  static globalController() {
    // var _sp = SharedPreferenceManager();
    // final firstOnboard = _sp.getIsFirstOnboarding();
    // if (firstOnboard) {
    //   Get.put<OnboardingController>(OnboardingController());
    // } else {
    //   Get.put<AuthController>(AuthController());
    // }
  }

  static globalLocalData() async {
    // Global Local Database
    await Get.putAsync<FlutterSecureStorage>(() async {
      return const FlutterSecureStorage();
    });
    await Get.putAsync<GetStorage>(() async {
      return GetStorage(StorageName.STORAGE_NAME);
    });
  }

  static Future<void> initHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    HiveAdapters().registerAdapter();
    await Hive.openBox<Mahasiswa>(HiveConstants.MAHASISWA_BOX);
    await Hive.openBox<Konselor>(HiveConstants.KONSELOR_BOX);
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
