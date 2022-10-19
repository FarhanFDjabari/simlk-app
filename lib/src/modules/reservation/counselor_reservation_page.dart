import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/reservation/controller/counselor_reservation_controller.dart';
import 'package:simlk_app/src/modules/reservation/widgets/reservation_schedule_tile.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class CounselorReservationPage extends GetView<CounselorReservationController> {
  const CounselorReservationPage({Key? key}) : super(key: key);

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
          text: 'Reservasi Konseling',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<CounselorReservationController>(
        builder: (_) {
          return StateHandleWidget(
            shimmerView: const LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            onRetryPressed: () {
              // controller.getDashboard("", "");
            },
            // errorEnabled: controller.isError,
            // errorText: 'txt_error_general'.tr,
            // emptyTitle: 'txt_challenge_empty_title'.tr,
            // emptySubtitle: 'txt_challenge_empty_description'.tr,
            // emptyEnabled: controller.isEmptyData,
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
                      onTap: () {
                        controller.goToDetail(id: index);
                      },
                      isStudentHistoryLayout: false,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(height: 8);
                  },
                  itemCount: 2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
