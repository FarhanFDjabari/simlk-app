import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/notification/notification.dart';
import 'package:simlk_app/src/modules/home/controller/counselor_home_controller.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';

class CounselorNotificationController extends BaseListController<Notification> {
  final RxInt badgeNumber = 0.obs;

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getAllNotifications();
  }

  Future<void> getAllNotifications() async {
    loadingState();
    await client().then((value) {
      value.fetchAllNotifications().validateStatus().then((data) {
        final notifUnreadCount =
            data.data?.where((element) => element.isRead == 0).length;

        Get.find<CounselorHomeController>().badgeNumber(notifUnreadCount);

        dataList.clear();
        setFinishCallbacks(data.data?.reversed.toList() ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
