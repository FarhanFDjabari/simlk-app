import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/home/controller/counselor_home_controller.dart';
import 'package:simlk_app/src/modules/reservation/widgets/reservation_schedule_tile.dart';
import 'package:simlk_app/src/res/gen/assets.gen.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class CounselorHome extends GetView<CounselorHomeController> {
  const CounselorHome({Key? key}) : super(key: key);

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
      ),
      body: GetBuilder<CounselorHomeController>(
        init: CounselorHomeController(),
        initState: (_) {},
        builder: (_) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (controller.localUserData.email?.isEmpty == true ||
                        controller.localUserData.noHp?.isEmpty == true ||
                        controller.localUserData.idLine?.isEmpty == true)
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
                            text: 'Profilmu belum lengkap',
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
                    if (controller.localUserData.email?.isEmpty == true ||
                        controller.localUserData.noHp?.isEmpty == true ||
                        controller.localUserData.idLine?.isEmpty == true)
                      const SizedBox(height: 10),
                    TextNunito(
                      text: 'Permintaan Reservasi Konseling',
                      size: 13.sp,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<CounselorHomeController>(
                      builder: (_) {
                        return Container(
                          constraints: BoxConstraints(maxHeight: 73.h),
                          child: StateHandleWidget(
                            shimmerView: const LoadingOverlay(),
                            loadingEnabled: controller.isLoading,
                            onRetryPressed: () {
                              // controller.getDashboard("", "");
                            },
                            // errorEnabled: controller.isError,
                            // errorText: 'txt_error_general'.tr,
                            emptyImage: AssetImage(
                              Assets.lib.src.res.images.dataEmpty.path,
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
                              child: ListView.separated(
                                shrinkWrap: true,
                                primary: false,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                itemBuilder: (_, index) {
                                  return ReservationScheduleTile(
                                    data: controller.dataList[index],
                                    onTap: () {
                                      controller.goToDetail(
                                          id: controller.dataList[index].id ??
                                              0);
                                    },
                                    isStudentHistoryLayout: false,
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return const SizedBox(height: 8);
                                },
                                itemCount: controller.dataList.length,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
