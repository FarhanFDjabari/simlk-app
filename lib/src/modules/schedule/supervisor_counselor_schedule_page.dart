import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/history/widgets/counselor_history_tile.dart';
import 'package:simlk_app/src/modules/schedule/controllers/supervisor_counselor_schedule_controller.dart';
import 'package:simlk_app/src/modules/schedule/widgets/custom_chip.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class SupervisorCounselorSchedulePage
    extends GetView<SupervisorCounselorScheduleController> {
  const SupervisorCounselorSchedulePage({Key? key}) : super(key: key);

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
          text: 'Jadwal Konselor',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16, right: 16),
              itemBuilder: (_, index) {
                return Obx(
                  () => CustomChip(
                    label: controller.dateChip[index],
                    isSelected: controller.dateChipSelectedIndex.value == index,
                    onSelected: (_) {
                      controller.dateChipSelectedIndex(index);
                      controller.getKonselorSchedule();
                    },
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return const SizedBox(width: 12);
              },
              itemCount: controller.dateChip.length,
            ),
          ),
          GetBuilder<SupervisorCounselorScheduleController>(
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
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  itemBuilder: (_, index) {
                    return CounselorHistoryTile(
                      data: controller.dataList[index],
                      displayStatus: true,
                      onTap: () {
                        controller.showCounselorInfoDialog(
                          data: controller.dataList[index],
                          counselorSchedule: controller.dataList[index].jadwal
                              ?.split(',')
                              .toList(),
                        );
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
          ),
        ],
      ),
    );
  }
}
