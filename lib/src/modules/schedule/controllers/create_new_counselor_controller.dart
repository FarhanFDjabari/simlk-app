import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';

class CreateNewCounselorController extends BaseObjectController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final majorController = TextEditingController();
  final nimController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final lineIdController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    majorController.dispose();
    nimController.dispose();
    phoneNumberController.dispose();
    lineIdController.dispose();
    super.dispose();
  }

  Future<void> registerKonselor() async {
    loadingState();
    await client().then((value) {
      value
          .registerKonselor(
            emailController.text,
            nimController.text,
            nameController.text,
            majorController.text,
            nimController.text,
            phoneNumberController.text,
            lineIdController.text,
          )
          .validateStatus()
          .then((data) {
        finishLoadData();
        Get.showSnackbar(SIMLKSnackbar(
          snackbarMessage: 'Registrasi Konselor Berhasil',
          snackbarStateEnum: SnackbarStateEnum.POSITIVE,
        ));
      }).handleError((onError) {
        debugPrint(onError);
        finishLoadData(errorMessage: onError);
      });
    });
  }
}
