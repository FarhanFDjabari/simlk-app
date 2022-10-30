import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/storage/secure_storage_manager.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/common/widgets/bottom_sheet/image_pick_bottomsheet.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentProfileController extends BaseObjectController<Mahasiswa> {
  @override
  void onInit() {
    if (StorageManager().has(StorageName.MAHASISWA)) {
      final mahasiswa =
          Mahasiswa.fromJson(StorageManager().get(StorageName.MAHASISWA));
      setFinishCallbacks(mahasiswa);
    }
    super.onInit();
  }

  void goToCompleteProfile() {
    Get.toNamed(PageName.profileCompleteStudent);
  }

  Future<void> updateProfile({required File image}) async {
    loadingState();

    await client().then((value) {
      value
          .updateKonselorProfile(
            imageProfile: image,
          )
          .validateStatus()
          .then((data) async {
        finishLoadData();
        await saveAuthData();
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  void showPhotoProfileBottomSheet() {
    Get.bottomSheet(
      ImagePickBottomSheet(
        multiFile: false,
        pickCallback: (image) {
          if (image != null) {
            updateProfile(image: image);
          }
          Get.back();
        },
        pickCallbackMultiple: (_) {},
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
    );
  }

  Future<void> saveAuthData() async {
    loadingState();
    await client().then((value) {
      value.fetchMahasiswaProfile().validateStatus().then((data) async {
        StorageManager().write(StorageName.MAHASISWA, data.data?.toJson());
        setFinishCallbacks(data.data);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> logout() async {
    loadingState();
    await client().then((value) {
      value.logout().validateStatus().then((data) async {
        await SecureStorageManager().setToken(value: null);
        StorageManager().write(StorageName.MAHASISWA, null);
        finishLoadData();
        Get.offAllNamed(PageName.auth);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
