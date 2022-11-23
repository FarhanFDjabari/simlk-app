import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/notification/notification.dart';
import 'package:simlk_app/src/modules/home/controller/counselor_home_controller.dart';
import 'package:simlk_app/src/modules/home/controller/supervisor_home_controller.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class SupervisorNotificationController
    extends BaseListController<Notification> {
  final RxInt badgeNumber = 0.obs;

  final dummyNotif = [
    Notification(
      id: 0,
      isRead: 0,
      title: 'Permintaan Bimbingan Konseling Baru',
      body:
          '195150700111015 membuat permintaan reservasi baru. Mohon untuk segera di proses',
      data: {
        'id_reservasi': 22,
        'status': 1,
      },
    ),
    Notification(
      id: 0,
      isRead: 1,
      title: 'Permintaan Bimbingan Konseling Baru',
      body:
          '215150400111002 membuat permintaan reservasi baru. Mohon untuk segera di proses',
      data: {
        'id_reservasi': 20,
        'status': 1,
      },
    ),
  ];

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getAllNotifications();
  }

  Future<void> goToDetail({
    required int id,
    required int status,
  }) async {
    if (status < 4) {
      // Get.toNamed('${PageName.reservationKonselor}/$id');
    } else {
      // Get.toNamed('/konselor/history/$id');
    }
  }

  Future<void> getAllNotifications() async {
    loadingState();
    // await client().then((value) {
    //   value.fetchAllNotifications().validateStatus().then((data) {
    final notifUnreadCount =
        dummyNotif.where((element) => element.isRead == 0).length;

    Get.find<SupervisorHomeController>().badgeNumber(notifUnreadCount);

    dataList.clear();
    setFinishCallbacks(dummyNotif.reversed.toList());
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }

  Future<void> markReadNotificationById({required int id, int? status}) async {
    loadingState();
    // await client().then((value) {
    //   value
    //       .markNotificationById(notificationId: id)
    //       .validateStatus()
    //       .then((data) {
    Future.delayed(const Duration(seconds: 1), () {
      finishLoadData();
      goToDetail(id: id, status: status ?? 0);
    });

    //     getAllNotifications();
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }

  Future<void> markReadAllNotifications() async {
    // loadingState();
    // await client().then((value) {
    //   value.markAllNotifications().validateStatus().then((data) {
    //     finishLoadData();
    //     getAllNotifications();
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }
}
