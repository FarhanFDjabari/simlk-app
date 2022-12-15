import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/notification/controllers/supervisor_notification_controller.dart';
import 'package:simlk_app/src/modules/notification/widgets/notification_tile.dart';
import 'package:simlk_app/src/res/gen/assets.gen.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/extensions/date_time_extension.dart';
import 'package:sizer/sizer.dart';

class SupervisorNotificationPage
    extends GetView<SupervisorNotificationController> {
  const SupervisorNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.neutral100,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Resources.color.gradient600to800,
          ),
        ),
        title: TextNunito(
          text: 'Notifikasi',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<SupervisorNotificationController>(
        builder: (_) {
          return StateHandleWidget(
            shimmerView: const LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            onRetryPressed: () {
              // controller.getDashboard("", "");
            },
            errorEnabled: controller.isError,
            errorText: 'txt_error_general'.tr,
            emptyImage: AssetImage(
              Assets.lib.src.res.images.notificationEmpty.path,
            ),
            emptyTitle: 'txt_empty_title'.tr,
            emptySubtitle: 'txt_empty_description'.tr,
            emptyEnabled: controller.isEmptyData,
            body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              onLoading: controller.loadNextPage,
              header: MaterialClassicHeader(
                color: Resources.color.indigo700,
              ),
              child: SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  itemBuilder: (_, index) {
                    return NotificationTile(
                      title: '${controller.dataList[index].title}',
                      content: '${controller.dataList[index].body}',
                      isRead: controller.dataList[index].isRead == 1,
                      date: DateTimeExtension(
                              controller.dataList[index].createdAt ??
                                  DateTime.now())
                          .dayMonthYear,
                      onTap: () {
                        if (controller.dataList[index].isRead == 1) {
                          controller.goToDetail(
                            id: controller
                                    .dataList[index].data['id_reservasi'] ??
                                0,
                            status: controller.dataList[index].data['status'],
                          );
                        } else {
                          controller.markReadNotificationById(
                            id: controller
                                    .dataList[index].data['id_reservasi'] ??
                                0,
                            status: controller.dataList[index].data['status'],
                          );
                        }
                      },
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(height: 4);
                  },
                  itemCount: controller.dataList.length,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
