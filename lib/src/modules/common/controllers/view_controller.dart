import 'package:get/get.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';

class ViewController extends BaseObjectController {
  final RxInt pageIndex = 0.obs;
  final RxInt badgeNumber = 0.obs;

  @override
  void onReady() {
    // Get.find<NotificationController>().getAllNotification();
    super.onReady();
  }
}
