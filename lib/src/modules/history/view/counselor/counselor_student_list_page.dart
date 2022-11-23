import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/history/controllers/counselor/counselor_student_list_controller.dart';
import 'package:simlk_app/src/res/gen/assets.gen.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class CounselorStudentListPage extends GetView<CounselorStudentListController> {
  const CounselorStudentListPage({Key? key}) : super(key: key);

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
          text: 'Riwayat Konseling',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextNunito(
                text: 'Daftar Konseli Mahasiswa',
                size: 13.sp,
                fontWeight: Weightenum.MEDIUM,
              ),
            ),
            const SizedBox(height: 10),
            GetBuilder<CounselorStudentListController>(
              init: CounselorStudentListController(),
              builder: (_) {
                return Container(
                  constraints: BoxConstraints(maxHeight: 80.h),
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
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.sp,
                          mainAxisSpacing: 16.sp,
                        ),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: controller.dataList.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              controller.goToReservationHistory(
                                  nim: '${controller.dataList[index].nim}');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Resources.color.indigo700,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Resources.color.indigo500,
                                    backgroundImage: NetworkImage(
                                      controller.dataList[index]
                                              .profileImageUrl ??
                                          "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextNunito(
                                    text: '${controller.dataList[index].name}',
                                    size: 16,
                                    maxLines: 2,
                                    align: TextAlign.center,
                                    fontWeight: Weightenum.REGULAR,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
