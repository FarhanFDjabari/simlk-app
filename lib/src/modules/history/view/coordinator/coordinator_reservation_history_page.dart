import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/history/controllers/coordinator/coordinator_reservation_history_controller.dart';
import 'package:simlk_app/src/modules/history/widgets/counselor_history_tile.dart';
import 'package:simlk_app/src/res/gen/assets.gen.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class CoordinatorReservationHistoryPage
    extends GetView<CoordinatorReservationHistoryController> {
  const CoordinatorReservationHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoordinatorReservationHistoryController>(
      init: CoordinatorReservationHistoryController(),
      initState: (_) {},
      builder: (_) {
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
          body: StateHandleWidget(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemBuilder: (_, index) {
                  return CounselorHistoryTile(
                    data: controller.dataList[index],
                    onTap: () {
                      controller.goToDetail(
                          id: controller.dataList[index].id ?? 0);
                    },
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
    );
  }
}
