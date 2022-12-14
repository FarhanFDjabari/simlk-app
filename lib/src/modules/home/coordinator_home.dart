import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/home/controller/coordinator_home_controller.dart';
import 'package:simlk_app/src/modules/reservation/widgets/reservation_schedule_tile.dart';
import 'package:simlk_app/src/res/gen/assets.gen.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class CoordinatorHome extends GetView<CoordinatorHomeController> {
  const CoordinatorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.neutral100,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextNunito(
          text:
              'Selamat Datang, ${controller.localUserData.name?.split(' ').first}!',
          maxLines: 1,
          size: 14.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.indigo700,
        actions: [
          GetX<CoordinatorHomeController>(
            init: CoordinatorHomeController(),
            initState: (_) {},
            builder: (_) {
              return IconButton(
                onPressed: () {
                  controller.goToNotification();
                },
                icon: Badge(
                  badgeContent: TextNunito(
                    text: '${controller.notificationCount}',
                    size: 9,
                    fontWeight: Weightenum.REGULAR,
                    maxLines: 1,
                    align: TextAlign.center,
                    color: Resources.color.neutral50,
                  ),
                  elevation: 0,
                  showBadge: controller.notificationCount.value > 0,
                  badgeColor: Resources.color.stateNegative,
                  shape: BadgeShape.circle,
                  animationType: BadgeAnimationType.scale,
                  animationDuration: const Duration(milliseconds: 250),
                  child: Icon(
                    controller.notificationCount.value > 0
                        ? Remix.notification_2_fill
                        : Remix.notification_2_line,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (controller.localUserData.nim?.isEmpty == true ||
                    controller.localUserData.profileImageUrl?.isEmpty == true ||
                    controller.localUserData.name?.isEmpty == true)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Resources.color.indigo50,
                      border: Border.all(
                        color: Resources.color.indigo700,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ListTile(
                      onTap: () {
                        controller.goToCompleteProfile();
                      },
                      title: TextNunito(
                        text: 'Profil anda belum lengkap',
                        size: 16,
                        fontWeight: Weightenum.BOLD,
                      ),
                      subtitle: TextNunito(
                        text:
                            'Lengkapi profil anda untuk memudahkan sistem dalam melakukan pendataan',
                        maxLines: 3,
                        size: 16,
                        fontWeight: Weightenum.REGULAR,
                      ),
                    ),
                  ),
                if (controller.localUserData.nim?.isEmpty == true ||
                    controller.localUserData.profileImageUrl?.isEmpty == true ||
                    controller.localUserData.name?.isEmpty == true)
                  const SizedBox(height: 10),
                TextNunito(
                  text: 'Permintaan Reservasi Konseling',
                  size: 13.sp,
                  fontWeight: Weightenum.REGULAR,
                ),
                const SizedBox(height: 10),
                GetBuilder<CoordinatorHomeController>(
                  builder: (_) {
                    return Container(
                      constraints: BoxConstraints(maxHeight: 70.h),
                      child: StateHandleWidget(
                        shimmerView: const LoadingOverlay(),
                        loadingEnabled: controller.isLoading,
                        onRetryPressed: () {
                          // controller.getDashboard("", "");
                        },
                        emptyImage: AssetImage(
                          Assets.lib.src.res.images.dataEmpty.path,
                        ),
                        emptyTitle: 'txt_empty_title'.tr,
                        emptySubtitle: 'txt_empty_description'.tr,
                        emptyEnabled: controller.isEmptyData,
                        body: SmartRefresher(
                          controller: controller.refreshController,
                          enablePullDown: true,
                          enablePullUp: false,
                          onRefresh: controller.refreshPage,
                          onLoading: controller.loadNextPage,
                          header: MaterialClassicHeader(
                            color: Resources.color.indigo700,
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return ReservationScheduleTile(
                                data: controller.dataList[index],
                                isStudentHistoryLayout: false,
                                onTap: () {
                                  controller.goToDetail(
                                      id: controller.dataList[index].id ?? 0);
                                },
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(height: 10);
                            },
                            itemCount: controller.dataList.length,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
