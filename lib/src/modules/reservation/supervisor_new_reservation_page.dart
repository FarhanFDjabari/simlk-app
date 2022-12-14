import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/reservation/controller/supervisor_new_reservation_controller.dart';
import 'package:simlk_app/src/modules/reservation/widgets/reservation_schedule_tile.dart';
import 'package:simlk_app/src/res/gen/assets.gen.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class SupervisorNewReservationPage
    extends GetView<SupervisorNewReservationController> {
  const SupervisorNewReservationPage({Key? key}) : super(key: key);

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
          text: 'Permintaan Reservasi Baru',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<SupervisorNewReservationController>(
        builder: (_) {
          return StateHandleWidget(
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
              child: SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  itemBuilder: (_, index) {
                    return ReservationScheduleTile(
                      data: controller.dataList[index],
                      onTap: () {
                        controller.goToDetail(
                            id: controller.dataList[index].id ?? 0);
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
    );
  }
}
