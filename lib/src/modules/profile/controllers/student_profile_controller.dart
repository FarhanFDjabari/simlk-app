import 'package:get/get.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentProfileController extends BaseObjectController {
  void goToCompleteProfile() {
    Get.toNamed(PageName.profileCompleteStudent);
  }
}
