import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/history/widgets/counselor_history_tile.dart';
import 'package:simlk_app/src/modules/schedule/controllers/coordinator_counselor_assign_controller.dart';
import 'package:simlk_app/src/modules/schedule/widgets/custom_chip.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class CoordinatorCounselorAssignPage
    extends GetView<CoordinatorCounselorAssignController> {
  const CoordinatorCounselorAssignPage({Key? key}) : super(key: key);

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
          text: 'Atur Konselor',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<CoordinatorCounselorAssignController>(
            builder: (_) => Expanded(
              child: StateHandleWidget(
                shimmerView: const LoadingOverlay(),
                loadingEnabled: controller.isLoading,
                onRetryPressed: () {
                  // controller.getDashboard("", "");
                },
                // errorEnabled: controller.isError,
                // errorText: 'txt_error_general'.tr,
                emptyTitle: 'txt_empty_title'.tr,
                emptySubtitle: 'txt_empty_description'.tr,
                emptyEnabled: controller.isEmptyData,
                body: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  itemBuilder: (_, index) {
                    return CounselorHistoryTile(
                      data: controller.dataList[index],
                      displayStatus: true,
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: controller.dataList.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
