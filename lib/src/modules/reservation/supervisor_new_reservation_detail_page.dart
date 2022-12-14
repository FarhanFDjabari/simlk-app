import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/description_text_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/reservation/controller/supervisor_new_reservation_detail_controller.dart';
import 'package:simlk_app/src/res/gen/assets.gen.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/extensions/date_time_extension.dart';
import 'package:sizer/sizer.dart';

class SupervisorNewReservationDetailPage
    extends GetView<SupervisorNewReservationDetailController> {
  const SupervisorNewReservationDetailPage({Key? key}) : super(key: key);

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
          text: 'Detail Reservasi Konseling',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<SupervisorNewReservationDetailController>(
        init: SupervisorNewReservationDetailController(),
        initState: (_) {},
        builder: (_) {
          return StateHandleWidget(
            shimmerView: const LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            onRetryPressed: () {
              // controller.getDashboard("", "");
            },
            errorEnabled: controller.isError,
            errorText: 'txt_empty_title'.tr,
            emptyTitle: 'txt_empty_title'.tr,
            emptySubtitle: 'txt_empty_description'.tr,
            emptyEnabled: controller.isEmptyData,
            body: SingleChildScrollView(
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextNunito(
                        text: 'Informasi Mahasiswa',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Resources.color.indigo300,
                            backgroundImage: NetworkImage(
                              controller.mData?.student?.profileImageUrl ??
                                  "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextNunito(
                                text: '${controller.mData?.student?.name}',
                                size: 16,
                                fontWeight: Weightenum.REGULAR,
                                maxLines: 2,
                                align: TextAlign.center,
                              ),
                              TextNunito(
                                text: '${controller.mData?.student?.nim}',
                                size: 14,
                                fontWeight: Weightenum.REGULAR,
                                maxLines: 2,
                                align: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextNunito(
                        text: 'Dosen Pembimbing Akademik',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 5),
                      TextNunito(
                        text: '${controller.mData?.student?.dpa}',
                        size: 16,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 10),
                      TextNunito(
                        text: 'Kontak',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 5),
                      TextNunito(
                        text:
                            '${controller.mData?.student?.noHp ?? "Tidak tersedia"}/${controller.mData?.student?.idLine ?? "Tidak tersedia"}',
                        size: 16,
                        isSelectable: true,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 16),
                      TextNunito(
                        text: 'Informasi Reservasi',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                      ),
                      const SizedBox(height: 5),
                      TextNunito(
                        text: 'Tipe Konsultasi',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 5),
                      TextNunito(
                        text: controller.mData?.type,
                        size: 16,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 10),
                      TextNunito(
                        text: 'Tanggal Konsultasi',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 5),
                      TextNunito(
                        text: DateTimeExtension(
                                controller.mData?.reservationTime ??
                                    DateTime.now())
                            .dayFullMonthYear,
                        size: 16,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 10),
                      TextNunito(
                        text: 'Waktu Konsultasi',
                        size: 16,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 5),
                      TextNunito(
                        text: '${controller.mData?.timeHours}',
                        size: 16,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 10),
                      TextNunito(
                        text: 'Deskripsi Singkat',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 5),
                      DescriptionTextWidget(
                        text: '${controller.mData?.description}',
                        size: 16,
                        fontWeight: Weightenum.REGULAR,
                        color: Resources.color.neutral900,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 32),
                      Obx(() => PrimaryButton(
                            elevation: 0,
                            height: 45,
                            label: 'Atur Jadwal',
                            isLoading: controller.isLoading,
                            isEnabled: controller.isActionTaken.isFalse,
                            onPressed: () {
                              controller.handleAsCounselor(
                                  id: controller.mData?.id ?? 0);
                            },
                          )),
                      const SizedBox(height: 8),
                      PrimaryButton(
                        elevation: 0,
                        height: 45,
                        label: 'Teruskan ke Konselor',
                        isLoading: controller.isLoading,
                        isEnabled: controller.isActionTaken.isFalse,
                        onPressed: () {
                          controller.assignToPeerCounselor(
                              id: controller.mData?.id ?? 0);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
